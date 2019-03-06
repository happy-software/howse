class AddZpidToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :zpid, :string
    add_index :houses, :zpid
  end
end
