class Item < ActiveRecord::Base
  has_many :ratings, -> { order("id desc") }
  has_many :raters, -> { uniq }, source: :user, through: :ratings
end
