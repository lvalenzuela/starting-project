class DropUselessTablesComputers < ActiveRecord::Migration
  def up
  	drop_table :computers_wifis
  	drop_table :computers_bluetooths
  	drop_table :computers_marcas
  end

  def down
  end
end
