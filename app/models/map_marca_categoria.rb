class MapMarcaCategoria < ActiveRecord::Base
  attr_accessible :marca_id, :categoria_id
  belongs_to :marca
  belongs_to :categoria
end
