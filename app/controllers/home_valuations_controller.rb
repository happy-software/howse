class HomeValuationsController < ApplicationController

  # GET /index
  def index
    @valuations = ZillowReport::HomeValuation.all

    render json: @valuations
  end
end
