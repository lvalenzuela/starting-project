class FixScreenSizes < ActiveRecord::Migration
  def up
  	computers = Computer.where('id < ?', 56)

  	computers.each do |computer|
  		case computer.screen_size
  		when 1
  			computer.update_attributes(:screen_size => 8)
  		when 2
  			computer.update_attributes(:screen_size => 9)
  		when 3
  			computer.update_attributes(:screen_size => 10)
  		when 4
  			computer.update_attributes(:screen_size => 11)
  		when 5
  			computer.update_attributes(:screen_size => 12)
  		when 6
  			computer.update_attributes(:screen_size => 13)
  		when 7
  			computer.update_attributes(:screen_size => 14)
  		when 8
  			computer.update_attributes(:screen_size => 15)
  		when 9
  			computer.update_attributes(:screen_size => 16)
  		when 10
  			computer.update_attributes(:screen_size => 17)
  		when 11
  			computer.update_attributes(:screen_size => 18)
  		when 12
  			computer.update_attributes(:screen_size => 19)
  		when 13
  			computer.update_attributes(:screen_size => 20)
  		when 14
  			computer.update_attributes(:screen_size => 21)
  		when 15
  			computer.update_attributes(:screen_size => 22)
  		when 16
  			computer.update_attributes(:screen_size => 23)
  		when 17
  			computer.update_attributes(:screen_size => 24)
  		end
  	end
  end

  def down
  end
end
