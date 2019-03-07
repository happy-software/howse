class AddReferenceToZillowReportHomeValuationFromHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :zillow_report_home_valuations, :zpid, :string
    add_index :zillow_report_home_valuations, :zpid
  end
end
