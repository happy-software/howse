class AssociateHomeValuationToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :zillow_report_home_valuations, :house_id, :integer
    add_index :zillow_report_home_valuations, :house_id
  end
end
