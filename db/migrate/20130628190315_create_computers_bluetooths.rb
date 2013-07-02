class CreateComputersBluetooths < ActiveRecord::Migration
  def change
    create_table :computers_bluetooths do |t|
      t.string :bluetooth
      t.timestamps
    end
  end
end
