class House < ApplicationRecord
  has_many :home_valuations, primary_key: :zpid, foreign_key: :zpid, class_name: 'ZillowReport::HomeValuation'

  def self.all_property_zpids
    self.pluck(:zpid)
  end

  def self.add_new_property(details)
    zpid    = details[:zpid]
    address = details[:address]
    Rails.logger.info("Adding new property with zpid: #{zpid} and address: #{address}")
    raise ArgumentError.new('Missing address') unless address
    raise ArgumentError.new("Missing Zillow Property ID (#{zpid})") unless zpid

    raise ArgumentError.new('Missing street address') unless address[:street]
    raise ArgumentError.new('Missing city') unless address[:city]
    raise ArgumentError.new('Missing state') unless address[:state]
    raise ArgumentError.new('Missing zip code') unless address[:zip_code]

    raise StandardError.new("Attempting to add duplicate ZPID: #{zpid}") if House.where(zpid: zpid).any?

    h = House.new(address: address, zpid: zpid)
    h.save!
  end
end
