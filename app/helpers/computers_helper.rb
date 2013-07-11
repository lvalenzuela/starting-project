module ComputersHelper

	def select_options(type)
		case type
		when 'boolean'
			return [["Si",1], ["No",0], ["No Especificado",]]
		when 'numbers'
			return [["No Especificado",-1],["0",0],["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],
    ["11",11],["12",12],["13",13],["14",14],["15",15],["16",16]]
		end
	end

	def display_data_type(raw_data, type)
		data = raw_data.to_s
		if data == ' ' || data =='-' || data == ''
			return '-'
		else
			case type
			when 'speed_proce'
				return data+' GHz'
			when 'batery_life'
				return data+' Horas'
			when 'memory_speed'
				return data+' MHz'
			when 'memory_cap'
				return data+' GB'
			when 'disc_small'
				return data+' GB'
			when 'disc_speed'
				return data+' RPM'
			when 'disc_big'
				return data+' TB'
			when 'weight'
				return data+' KG'
			when 'dimensions'
				return data+' mm'
			end
		end
	end
end
