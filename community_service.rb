require 'csv'
require 'date'


def import_file_info
#input is a csv, output is new updated csv file
	
	newfile = File.open('risk_factor_file.csv', "w")
		
		CSV.foreach ('Community_service_scrubbed.csv') do |row|
			if row[0] == "Name"
				header = (row.push("Hours Remaining,Days Remaining")).join(",")
				newfile.print "#{header}\n"
			else
				hours = hours_remaining(row)
				converted_date = convert_date_format(row)
				days = days_left(converted_date, Date.today)
				risk= risk_factor(hours,days, row)
				row[7] = risk
				row[6] = "" if row[6] == "70-1-1"
				days = "Missing Data" if days < -10000
				hours = "Missing Data" if row[4] == nil || row[5] == nil
				new = (row.push(hours, days,)).join(",")
				
				
				newfile.print "#{new}\n"
				end
			end
			newfile.close
	end	
		
	



def hours_remaining(array)
#Input is an array of 
		assigned = array[4].to_f
		completed = array[5].to_f
	
		remaining_hours = assigned - completed
 
end

def get_new_date_format(initial_date)
	initial_date = "1.1.70"	if initial_date == nil
	
		
	old_date = initial_date.split "."
	
	old_date[0] = "01" if old_date[0] =~ /\D/
	old_date[1] = "01" if old_date[1] =~ /\D/
	old_date[2] = "1970" if old_date[2] =~ /\D/
	
	new_date = "#{old_date[2]}-#{old_date[0]}-#{old_date[1]}"
	
end













def convert_date_format(array)
	array[6] = "1.1.70"	if array[6] == nil
	
	old_date_string = array[6]	
	old_date = old_date_string.split "."
	
	old_date[0] = "01" if old_date[0] =~ /\D/
	old_date[1] = "01" if old_date[1] =~ /\D/
	old_date[2] = "1970" if old_date[2] =~ /\D/
	
	new_date = "#{old_date[2]}-#{old_date[0]}-#{old_date[1]}"
	array[6] = new_date

	array
end

def days_left(array, date)
today = (date).to_s
	days = Date.parse(array[6]) - Date.parse(today)
	days_left = days.to_i
end	

def risk_factor(hours, days, row)
	days = -1 if days == 0
	risk = hours / days.to_f
	if row[4] == nil || row[5] == nil || row[6] == "70-1-1"
		risk_factor = "Missing Data"
	elsif risk == 0
		risk_factor = "Hours Completed"
	elsif risk < 0
		risk_factor = "High Risk"
	else 
		risk_factor = risk.round(2)
	end
end










import_file_info

