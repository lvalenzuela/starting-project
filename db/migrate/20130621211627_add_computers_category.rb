class AddComputersCategory < ActiveRecord::Migration
  def up
    ComputersCategory.create(:category => 'Ultrabook')
  end

  def down
    ComputersCategory.where(:category => 'Ultrabook').destroy_all
  end
end
