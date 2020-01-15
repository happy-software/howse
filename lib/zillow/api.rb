module Zillow
  class API

    attr_reader :key

    def initialize
      @key = ENV['ZILLOW_ZWSID']
      connect!
    end

    def pull_property_details(zpid)
      log("Starting pull_property_details for #{zpid}")
      ZillowReport::HomeValuation.add_new_response(home_valuation(zpid).as_json.deep_symbolize_keys!)
      log("Completed pull_property_details for #{zpid}")
    end

    def find_property(address)
      raise ArgumentError.new('Missing Street Address') unless address[:street_address]
      raise ArgumentError.new('Missing City')           unless address[:city]
      raise ArgumentError.new('Missing State')          unless address[:state]
      raise ArgumentError.new('Missing Zip Code')       unless address[:zip]

      log("Starting ZPID lookup for #{address}")
      citystatezip = "#{address[:city]}, #{address[:state]} #{address[:zip]}"
      result = Rubillow::HomeValuation.search_results(address: address[:street_address], citystatezip: citystatezip)

      # TODO: No need to return an array; update the front end at some point to do this too
      return [{address: "Not Found", zpid: "Not Found"}] unless result.success?
      address = {
          street:      result.address[:street],
          city:        result.address[:city],
          state:       result.address[:state],
          zip_code:    result.address[:zipcode],
      }
      [{address: address, zpid: result.zpid}]
    end

    private

    def connect!
      Rubillow.configure do |config|
        config.zwsid = @key
      end
    end

    def home_valuation(zpid)
      Rubillow::HomeValuation.zestimate(zpid: zpid)
    end

    def log(message)
      timestamp = Time.current
      Rails.logger.info("[#{timestamp}] - #{message}")
    end
  end
end
