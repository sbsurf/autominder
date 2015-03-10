class MakesController < ApplicationController
  def index
    year = params[:year]

    if year
      @makes = Edmunds::Make.new.find_makes_by_model_year(year)
    else
      @makes = Edmunds::Make.new.find_all
    end

    render json: @makes, meta: { total_count: @makes.count }
  end
end
