class User < ActiveRecord::Base
  has_many :ratings, -> { order("score desc") }
  has_many :rated_items, -> { uniq }, source: :item, through: :ratings
  has_many :user_similarities, -> { order("value desc") }
  has_many :similar_users, through: :user_similarities, source: :target

  has_secure_password
  validates_presence_of :password, on: :create

  scope :recommended_items, ->(algorithm = nil) {
    case algorithm
    when :negative
    else # collaborative_filtering
      
    end    
  }

end
