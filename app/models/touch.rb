class Touch < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :reaction, polymorphic: true
end
