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

  def self.export_csv(params)
    require 'csv'
    require 'kconv'

    ratings = search_by_condition(params)
    header = create_csv_header
    file = CSV.generate(headers: header, write_headers: true, force_quotes: true) do |csv|
      ratings.each do |rating|
        line = []
        line << Rating.nil_to_str(rating.item.name)
        line << Rating.nil_to_str(rating.user.email)
        line << Rating.nil_to_str(rating.type)
        line << Rating.nil_to_str(rating.value)
        csv << line
      end
    end

    file
  end

  def self.create_csv_header
    header = []
    header << 'Item'
    header << 'User'
    header << 'Type'
    header << 'Value'
    header
  end

  def self.nil_to_str(value)
    case value
    when nil
      ""
    when Date
      value.strftime("%Y/%m/%d")
    when DateTime
      value.strftime("%Y/%m/%d %H")
    else
      value.to_s
    end
  end
end
