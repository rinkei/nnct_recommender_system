class Seeing < ActiveRecord::Base
  has_one :touch, :as => :reaction
end
