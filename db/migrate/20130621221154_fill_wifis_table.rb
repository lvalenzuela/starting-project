class FillWifisTable < ActiveRecord::Migration
  def up
    ComputersWifi.create(:wifi => '802.11 a/b/g/n')
    ComputersWifi.create(:wifi => '802.11 b/g/n')
    ComputersWifi.create(:wifi => '802.11 n')
  end

  def down
    ComputersWifi.destroy_all
  end
end
