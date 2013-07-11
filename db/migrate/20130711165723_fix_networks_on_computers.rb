class FixNetworksOnComputers < ActiveRecord::Migration
  def up
  	computers = Computer.find(:all)
  	computers.each do |c|
  		case c.wifi.to_i
  		when 1
  			c.update_attributes(:wifi => 2)
  		when 2
  			c.update_attributes(:wifi => 3)
  		when 3
  			c.update_attributes(:wifi => 4)
  		when 4
  			c.update_attributes(:wifi => 16)
  		end

  		case c.bluetooth.to_i
  		when 1
  			c.update_attributes(:bluetooth => 5)
  		when 2
  			c.update_attributes(:bluetooth => 7)
  		when 3
  			c.update_attributes(:bluetooth => 8)
  		when 4
  			c.update_attributes(:bluetooth => 9)
  		when 5
  			c.update_attributes(:bluetooth => 10)
  		when 6
  			c.update_attributes(:bluetooth => 11)
  		when 7
  			c.update_attributes(:bluetooth => 12)
  		when 8
  			c.update_attributes(:bluetooth => 13)
  		when 9
  			c.update_attributes(:bluetooth => 17)
  		when 10
  			c.update_attributes(:bluetooth => 14)
  		when 11
  			c.update_attributes(:bluetooth => 15)
  		when 12
  			c.update_attributes(:bluetooth => 16)
  		end
  	end
  end

  def down
  	computers = Computer.find(:all)

  	computers.each do |c|
  		case c.wifi.to_i
  		when 2
  			c.update_attributes(:wifi => 1)
  		when 3
  			c.update_attributes(:wifi => 2)
  		when 4
  			c.update_attributes(:wifi => 3)
  		when 16
  			c.update_attributes(:wifi => 4)
  		end

  		case c.bluetooth.to_i
  		when 5
  			c.update_attributes(:bluetooth => 1)
  		when 7
  			c.update_attributes(:bluetooth => 2)
  		when 8
  			c.update_attributes(:bluetooth => 3)
  		when 9
  			c.update_attributes(:bluetooth => 4)
  		when 10
  			c.update_attributes(:bluetooth => 5)
  		when 11
  			c.update_attributes(:bluetooth => 6)
  		when 12
  			c.update_attributes(:bluetooth => 7)
  		when 13
  			c.update_attributes(:bluetooth => 8)
  		when 17
  			c.update_attributes(:bluetooth => 9)
  		when 14
  			c.update_attributes(:bluetooth => 10)
  		when 15
  			c.update_attributes(:bluetooth => 11)
  		when 16
  			c.update_attributes(:bluetooth => 12)
  		end
  	end
  end
end
