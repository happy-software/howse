module Zillow
  class API

    attr_reader :key

    def initialize
      @key = ENV['ZILLOW_ZWSID']
      connect!
    end

    def pull_property_details(zpid)
      logger.info('Starting pull_property_details for ' + zpid)
    end

    private

    def connect!
      Rubillow.configure do |config|
        config.zwsid = @key
      end
    end


  end
end
