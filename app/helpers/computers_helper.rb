module ComputersHelper

	def select_options(type)
		case type
		when 'boolean'
			return [["Si",1], ["No",0]]
		when 'numbers'
			return [["0",0],["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],
    ["11",11],["12",12],["13",13],["14",14],["15",15],["16",16]]
		end
	end
end
