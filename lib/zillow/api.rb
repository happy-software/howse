module Zillow
  class API

    attr_reader :key

    def initialize
      @key = ENV['ZILLOW_ZWSID']
      connect!
    end

    def pull_property_details(zpid)
      log('Starting pull_property_details for ' + zpid)
      log(home_valuation(zpid).as_json.deep_symbolize_keys!)
      log('Completed pull_property_details for' + zpid)
    end

    private

    def connect!
      Rubillow.configure do |config|
        config.zwsid = @key
      end
    end

    def home_valuation(zpid)
      @home_valuation ||= Rubillow::HomeValuation.zestimate(zpid: zpid)
    end

    def log(message)
      timestamp = Time.current
      Rails.logger.info("[#{timestamp}] - #{message}")
    end
  end
end
