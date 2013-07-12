class StoredTechs < ActiveRecord::Migration
  def up
  	cmps= Computer.find(:all)

  	cmps.each do |s|
  		case s.screen_type.to_i
  		when 2 #1 LED
  			s.update_attributes(:screen_type => 1)
  		when 1 #2 LCD
  			s.update_attributes(:screen_type => 2)
  		when 3 #8 LED Retina display
  			s.update_attributes(:screen_type => 8)
  		when 6 #9 no especificado
  			s.update_attributes(:screen_type => 9)
  		end
  	end
  end

  def down
  end
end
