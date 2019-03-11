require 'zillow/zillow_jobs'

namespace :zillow_jobs do

  desc 'Say hello!'
  task :run => :environment do
    ZillowJobs.run!
  end
end
