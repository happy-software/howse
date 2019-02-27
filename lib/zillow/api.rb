module Zillow
  class API

    attr_reader :key

    def initialize
      @key = ENV['ZILLOW_ZWSID']
      connect!
    end

    private

    def connect!
      Rubillow.configure do |config|
        config.zwsid = @key
      end
    end


  end
end
