class MapDisplayTechsCategoria < ActiveRecord::Base
  attr_accessible :display_tech_id, :categoria_id

  belongs_to :display_tech
  belongs_to :categoria
end
