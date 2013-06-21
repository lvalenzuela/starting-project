class AddWifiTable < ActiveRecord::Migration
  def up
    create_table :computers_wifis do |t|
      t.string :wifi
      t.timestamp
    end
  end

  def down
    drop_table :computers_wifis
  end
end
