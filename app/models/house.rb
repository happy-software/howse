class House < ApplicationRecord
  has_many :home_valuations, primary_key: :zpid, foreign_key: :zpid, class_name: 'ZillowReport::HomeValuation'

  def self.all_property_zpids
    self.pluck(:zpid)
  end
end
