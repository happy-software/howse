class CreateZillowReportHomeValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :zillow_report_home_valuations do |t|
      t.text :raw_response
      t.jsonb :details

      t.timestamps
    end
  end
end
