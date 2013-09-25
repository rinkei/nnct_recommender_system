class Touch < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  has_many :seeings 
  has_many :ratings
end
