class CreateTelevisions < ActiveRecord::Migration
  def change
    create_table :televisions do |t|
      
      t.timestamps
    end
  end
end
