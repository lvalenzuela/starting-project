class AddNullMemoryType < ActiveRecord::Migration
  def up
    ComputersMemoria.create(:tipo => '-')
  end

  def down
    ComputersMemoria.where(:tipo => '-').destroy
  end
end
