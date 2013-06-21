class ComputersAddColumnPesoAndTouchAttribute < ActiveRecord::Migration
  def up
    add_column :computers, :peso, :string
    
    ComputersScreenType.create(:tipo => 'Touch')
  end

  def down
    remove_column :computers, :peso
    
    ComputersScreenType.where(:tipo => 'Touch').destroy_all
  end
end
