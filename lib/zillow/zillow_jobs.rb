require './lib/zillow/api'

module ZillowJobs

  def self.run!
    zillow_property_ids = get_property_zpids
    ZillowJobs.run_daily_property_updates(zillow_property_ids)
  end

  def self.run_daily_property_updates(zpids = [])
    zpids.each do |zpid|
      api.pull_property_details(zpid)
    end
  end

  private

  def self.api
    @api ||= Zillow::API.new
  end

  def self.get_property_zpids
    ::House.all_property_zpids
  end

end