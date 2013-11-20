class Item < ActiveRecord::Base
  has_many :ratings, -> { order("id desc") }
  has_many :raters, -> { uniq }, source: :user, through: :ratings

  def self.recommended_for(user, similars_num: Settings.recommender_num)
    similars = user.similar_users.limit(similars_num)

    # collecting similar users' ratings
    # similars_ratings is a hash, assume item_id is key and Rating array is value
    similars_ratings = similars.map{|user| user.ratings}.flatten.group_by{|rating| rating.item_id}
    sorted_similars_ratings = similars_ratings.sort_by{|k, v| -v.size}

    # arranged_ratings is a hash that the Item's id is key and score average is value
    recommendation_scores = sorted_similars_ratings.inject({}) do|hash, kv|
      # kv is array: [key(item_id), value(rating)]
      hash[kv[0]] = kv[1].inject(0){|sum, rating| sum += rating.score}/kv[1].size.to_f
      hash
    end

    # change to array that sorted score desc
    sorted_recommendation_scores = recommendation_scores.sort{|a, b| b[1] <=> a[1]}
    sorted_ids = sorted_recommendation_scores.map{|rating| rating[0]}

    # return recommend items 
    items = Item.find(sorted_ids) - user.rated_items
    items = sorted_ids.collect{|id| items.detect{|item| item.id == id}}.compact
  end
end
