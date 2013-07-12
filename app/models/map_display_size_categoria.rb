class MapDisplaySizeCategoria < ActiveRecord::Base
  attr_accessible :display_size_id, :categoria_id

  belongs_to :display_size
  belongs_to :categoria
end
