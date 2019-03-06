class Zillow::HomeValuation < ApplicationRecord
  def self.add_new_response(response)
    puts "Response: #{response}"
    response               = response.deep_symbolize_keys!
    puts "After deep symbolizing keys"
    valuation              = self.new
    puts "Created a new valuation: #{valuation}"
    valuation.raw_response = response.delete(:xml).to_s
    puts "Response after removing XML: #{response}"
    valuation.details      = response
    puts 'Before saving new valuation'
    valuation.save!
  end
end
