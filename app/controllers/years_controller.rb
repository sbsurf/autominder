class YearsController < ApplicationController
  def index
    @years = Edmunds::ModelYear.new.find_distinct_year_with_new_or_used
    render json: @years, meta: { total_count: @years.count }
  end
end
