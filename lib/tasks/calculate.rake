# encoding: utf-8

namespace :calculate do
  task similarity: :environment do
    @users = User.all
    @targets = User.all

    @users.each do |user|
      @targets.each do |trgt|
        # 新規ユーザーで見つからなかった場合はユーザ類似度モデルを作成
        next if user.id == trgt.id
        us = UserSimilarity.find_or_create_by!(user: user, target: trgt)

        user_ratings_absolute_value_sum = 0 # ユーザ評価値の二乗の和の平方根
        inner_product = 0 # ユーザ間の評価値の内積 

        user.ratings.where(type: "GeneralRating").each do |ur|
          if tr = trgt.ratings.order("id desc").find_by(type: "GeneralRating", item: ur.item)
            inner_product += ur.score * tr.score
          end

          user_ratings_absolute_value_sum += (ur.score ** 2)
        end

        user_ratings_absolute_value_sum = Math.sqrt(user_ratings_absolute_value_sum)
        trgt_ratings_absolute_value = trgt.ratings.where(type: "GeneralRating").inject(0){ |sum, r| sum += r.score ** 2 }
        trgt_ratings_absolute_value = Math.sqrt(trgt_ratings_absolute_value)

        absolute_values_product = user_ratings_absolute_value_sum * trgt_ratings_absolute_value
        similarity = inner_product / absolute_values_product rescue 0
        us.update_attribute(:value, similarity)

      end
    end
  end
end

