require 'csv'
require 'date'


def import_file_info
#input is a csv, output is new_array
	probationers = CSV.read('Community_service_scrubbed.csv')
	newfile = File.open('risk_factor_file.csv', "w")
		
		CSV.foreach ('Community_service_scrubbed.csv') do |row|
			if row[0] == "Name"
				header = row.join(",")
				newfile.print header << ",Hours Remaining,Days Remaining,Risk Factor\n"
			else
				hours = hours_remaining(row)
				days = days_left(row)
				risk= risk_factor(row)
				new = (row.push(hours, days, risk)).join(",")
				newfile.print "#{new}\n"
			end
		end
	
end


def hours_remaining(array)
		assigned = array[4].to_f
		completed = array[5].to_f
	
		remaining_hours = assigned - completed
 
end

def days_left(array)
	today = Date.today #format YYYY/MM/DD
	
	if array[6] == nil
		array[6] = "1.1.70"
	end
	
	max_date = array[6] #formatted MM/DD/YYYY/
	
	modified_max_date_array = max_date.split(".")
	modified_max_date = modified_max_date_array[2] + "." + modified_max_date_array[0]+ "." + modified_max_date_array[1]
	(Date.parse(modified_max_date) - today).to_i
	
end

def risk_factor(array)






end
import_file_info

