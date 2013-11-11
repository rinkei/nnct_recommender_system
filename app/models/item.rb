class Item < ActiveRecord::Base
  has_many :ratings, -> { order("id desc") }
  has_many :raters, -> { uniq }, source: :user, through: :ratings

  def self.recommended_for(user, limit_num: Settings.recommender_num)
    similar_users = user.similar_users.limit(limit_num)

    # similar ratings collecting
    # similar_users_ratings is a hash, assumes item_id is key and Rating array is value
    similar_users_ratings = similar_users.map{|user| user.ratings}.flatten.group_by{|rating| rating.item_id}

    # arranged_ratings is a hash that the Item's id is key and score average is value
    recommendation_scores = similar_users_ratings.inject({}) do|x, kv|
      x[kv[0]] = kv[1].inject(0){|sum, r| sum += r.score}/kv[1].size.to_f # kv is array [key, value]
      x
    end

    # change to array that sorted score desc
    sorted_recommendation_scores = recommendation_scores.sort{|a, b| b[1] <=> a[1]}

    # return recommend items 
    Item.find(sorted_recommendation_scores.map{|rating| rating[0]})    
  end
end
