class CreateZillowHomeValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :zillow_home_valuations do |t|
      t.text :raw_response
      t.jsonb :details

      t.timestamps
    end
  end
end
