class Rating < ActiveRecord::Base
  belongs_to :item
  belongs_to :user

  DESCENDANTS = ["GeneralRating", "LooksRating", "UsabilityRating"]

  def self.search_by_condition(params)
    rtng = Rating.arel_table
    cond = nil
    params.each_pair do |key, val|
      if val.present?
        case key
        when "type"
          cond = cond ? cond.and(rtng[:type].eq(val)) : rtng[:type].eq(val)
        when "bottom"
          cond = cond ? cond.and(rtng[:value].gteq(val)) : rtng[:value].gteq(val)
        when "top"
          cond = cond ? cond.and(rtng[:value].lteq(val)) : rtng[:value].lteq(val)
        end
      end
    end

    where(cond)
  end
end
