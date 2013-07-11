class CreateTelevisionTables < ActiveRecord::Migration
  def up
  	create_table :televisions do |t|
  		t.integer :marca_id
  		t.string :modelo, :limit => 100
  		t.integer :precio
  		t.string :tipo_pantalla_id
  		
  	end
  end

  def down
  end
end
