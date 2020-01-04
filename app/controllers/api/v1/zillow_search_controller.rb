require 'zillow/api'

class Api::V1::ZillowSearchController < ApplicationController
  def lookup_address
    p = zillow_search_params
    addresses = Zillow::API.new.find_property(p)
    render json: addresses
  end

  private

  def zillow_search_params
    params.require(:address).permit(:street_address, :city, :state, :zip)
  end
end
