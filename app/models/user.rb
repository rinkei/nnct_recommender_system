class User < ActiveRecord::Base
  has_many :ratings, -> { order("score desc") }
  has_many :rated_items, -> { uniq }, source: :item, through: :ratings
  has_many :user_similarities, ->(user) { where("target_id IS NOT ?", user.id).order("value desc") }
  has_many :similar_users, ->(user) { where("user_similarities.value > ?", user.similarity_threshold) }, through: :user_similarities, source: :target

  has_secure_password
  validates_presence_of :password, on: :create

  attr_accessor :similarity_threshold

  after_initialize do
    @similarity_threshold = 0.5
  end

  scope :recommended_items, ->(algorithm = nil) {
    case algorithm
    when :negative
    else # collaborative_filtering
      
    end    
  }

end
