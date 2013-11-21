module RatingsHelper
  def rating_score_means
    [t('activerecord.attributes.rating.very_good'),
     t('activerecord.attributes.rating.good'),
     t('activerecord.attributes.rating.normal'),
     t('activerecord.attributes.rating.bad'),
     t('activerecord.attributes.rating.very_bad')]
  end

  def mean_of_score(num)
    case num
    when 5
      t('activerecord.attributes.rating.very_good')
    when 4
      t('activerecord.attributes.rating.good')
    when 3
      t('activerecord.attributes.rating.normal')
    when 2
      t('activerecord.attributes.rating.bad')
    when 1
      t('activerecord.attributes.rating.very_bad')
    else
      raise
    end
  end
end
