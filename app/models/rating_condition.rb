class RatingCondition
  include ActiveModel::Model
  attr_accessor :type, :top, :bottom

  def to_hash
    { type: type, top: top, bottom: bottom }
  end
end
