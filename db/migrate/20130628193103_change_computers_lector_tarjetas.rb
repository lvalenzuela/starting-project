class ChangeComputersLectorTarjetas < ActiveRecord::Migration
  def up
    change_column :computers, :lector_tarjeta_memoria, :string
  end

  def down
    change_column :computers, :lector_tarjeta_memoria, :integer
  end
end
