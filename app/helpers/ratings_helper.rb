module RatingsHelper
  def rating_score_means
    [t('activerecord.attributes.rating.very_good'),
     t('activerecord.attributes.rating.good'),
     t('activerecord.attributes.rating.normal'),
     t('activerecord.attributes.rating.bad'),
     t('activerecord.attributes.rating.very_bad')]
  end
end
