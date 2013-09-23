class Admin::RatingsController < Admin::BaseController
  before_action :rating_condition, only: %w(search csv)

  def index
    @ratings = Rating.all
    @rating_condition = RatingCondition.new
  end

  def search
    @ratings = Rating.search_by_condition(rating_condition)
    @rating_condition = RatingCondition.new(rating_condition)

    render 'index'
  end

  def csv
    csv_file = Rating.export_csv(rating_condition)
    send_data csv_file, type: 'text/csv', filename: "ratings.csv"
  end

  private
  
  def rating_condition
    params.require(:rating_condition)
  end
end
