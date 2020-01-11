require 'zillow/zillow_jobs'

namespace :zillow_jobs do

  desc 'Collects Zillow Zestimates'
  task :run => :environment do
    ZillowJobs.run!
  end
end
