class FixDataTypes < ActiveRecord::Migration
  def up
  	computers = Computer.find(:all)

  	computers.each do |c|
  		if !c.bateria_duracion.nil?
  			c.update_attributes(:bateria_duracion => c.bateria_duracion + " Hrs" )
  		end
  		if !c.proce_velocidad.nil?
  			c.update_attributes(:proce_velocidad => c.proce_velocidad + " GHz")
  		end
  		if c.memoria.to_s != '-1'
  			c.update_attributes(:memoria => c.memoria + ' GB')
  		else
  			c.update_attributes(:memoria => '')
  		end
  		if !c.memoria_velocidad.nil?
  			c.update_attributes(:memoria_velocidad => c.memoria_velocidad + " MHz")
  		end
  		if c.memoria_max.to_s != '-1'
  			c.update_attributes(:memoria_max => c.memoria_max + " GB")
  		else
  			c.update_attributes(:memoria_max => '')
  		end
  		if !c.disco_capacidad.nil?
  			c.update_attributes(:disco_capacidad => c.disco_capacidad + " GB")
  		end
  		if !c.disco_ssd.nil?
  			c.update_attributes(:disco_ssd => c.disco_ssd + " GB")
  		end
  	end
  end

  def down
  end
end
