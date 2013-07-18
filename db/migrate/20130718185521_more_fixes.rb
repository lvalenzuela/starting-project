class MoreFixes < ActiveRecord::Migration
  def up
  	computers = Computer.find(:all)

  	computers.each do |c|
  		if c.proce_nucleos == -1 || c.proce_nucleos == 0
  			c.update_attributes(:proce_nucleos => nil)
  		end
  		if c.memoria_ranuras == -1 || c.memoria_ranuras == 0
  			c.update_attributes(:memoria_ranuras => nil)
  		end
  	end
  end

  def down
  end
end
