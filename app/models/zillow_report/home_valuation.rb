module ZillowReport
  class HomeValuation < ApplicationRecord

    belongs_to :house

    def self.add_new_response(response)
      response               = response.deep_symbolize_keys!
      valuation              = ZillowReport::HomeValuation.new
      valuation.raw_response = response.delete(:xml).to_s
      valuation.details      = response
      valuation.zpid         = response[:zpid]

      valuation.save!
    end
  end
end

