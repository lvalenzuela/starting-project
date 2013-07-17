class ComputersAditionalFeatures < ActiveRecord::Migration
  def up
  	create_table :computer_aditional_features do |t|
  		t.string :feature
  		t.timestamps
  	end

  	create_table :map_computer_aditional_features do |t|
  		t.belongs_to :computer
  		t.belongs_to :computer_aditional_feature
  		t.timestamps
  	end
  end

  def down
  	drop_table :computer_aditional_features
  	drop_table :map_computer_aditional_features
  end
end
