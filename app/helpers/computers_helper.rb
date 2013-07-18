module ComputersHelper

	def feature_check(computer, feature)
		if computer.id
			if MapComputerAditionalFeature.where('computer_id = ? and computer_aditional_feature_id = ?', computer.id, feature).empty?
				return false
			else
				return true
			end
		else
			return false
		end
	end

	def select_options(type)
		case type
		when 'boolean'
			return [["Si",1], ["No",0], ["No Especificado",]]
		end
	end

	def data_type_select(feature)
		case feature
		when 'batery_life'
			return options_for_select({"Horas" => "Hrs", "-" => ""}, "Hrs")
		when 'proce_speed'
			return options_for_select({"MHz" => "MHz", "GHz" => "GHz", "-" => ""}, "GHz")
		when 'disc_storage'
			return options_for_select({"GB" => "GB", "TB" => "TB", "-" => ""}, "GB")
		when 'disc_speed'
			return options_for_select({"RPM" => "RPM", "-" => ""}, "RPM")
		when 'ram_storage'
			return options_for_select({"MB" => "MB", "GB" => "GB", "-" => ""}, "GB")
		when 'ram_speed'
			return options_for_select({"MHz" => "MHz", "GHz" => "GHz", "-" => ""}, "MHz")
		end
	end
end
