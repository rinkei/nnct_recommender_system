class UserSimilarity < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, class_name: 'User', foreign_key: 'target_id'
end
