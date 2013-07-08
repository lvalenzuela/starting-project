class ModifyComputersTable < ActiveRecord::Migration
  def up
    rename_column :computers, :usb, :usb_2
    add_column :computers, :usb_3, :integer
    ComputersScreenType.where(:tipo => 'Touch').destroy_all
    add_column :computers, :screen_touch, :integer, :limit => 1
  end

  def down
    rename_column :computers, :usb_2, :usb
    remove_column :computers, :usb_3
    ComputersScreenType.create(:tipo => 'Touch')
    remove_column :computers, :screen_touch
  end
end
