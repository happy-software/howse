module ZillowReport
  class HomeValuation < ApplicationRecord

    belongs_to :house, foreign_key: :zpid, primary_key: :zpid

    def self.add_new_response(response)
      response               = response.with_indifferent_access
      valuation              = ZillowReport::HomeValuation.new
      valuation.raw_response = response.delete(:xml).to_s
      valuation.details      = response
      valuation.zpid         = response[:zpid]
      valuation.house        = House.where(zpid: response[:zpid]).first

      valuation.save!
    end

    def price
      self.details['price']
    end
  end
end

