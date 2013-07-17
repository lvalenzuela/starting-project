class DisplayResolution < ActiveRecord::Migration
  def up
  	create_table :display_standards do |t|
  		t.string :standard
  		t.timestamps
  	end

  	create_table :map_display_resolution_display_standards do |t|
  		t.belongs_to :display_resolution
  		t.belongs_to :display_display_standard
  		t.timestamps
  	end

  end

  def down
  	drop_table :display_standards
  	drop_table :map_display_resolution_display_standards
  end
end
