class House < ApplicationRecord
  def self.all_property_zpids
    self.pluck(:zpid)
  end
end
