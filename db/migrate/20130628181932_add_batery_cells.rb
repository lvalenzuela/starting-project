class AddBateryCells < ActiveRecord::Migration
  def up
    add_column :computers, :bateria_celdas, :integer
  end

  def down
    remove_column :computers, :bateria_celdas
  end
end
