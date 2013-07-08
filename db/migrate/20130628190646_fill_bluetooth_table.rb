class FillBluetoothTable < ActiveRecord::Migration
  def up
    execute "TRUNCATE computers_bluetooths"
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v1.0')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v1.1')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v1.2')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v2.0')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v2.0 + EDR')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v2.1')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v2.1 + EDR')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v3.0')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v3.0 + HS')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v4.0')
    ComputersBluetooth.create(:bluetooth => 'Bluetooth v4.0 + HS')
  end

  def down
    ComputersBluetooth.destroy_all
  end
end
