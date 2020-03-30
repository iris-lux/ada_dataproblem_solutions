require 'csv'
table = CSV.parse(File.read("C:/Ruby/ada/City_of_Albany_Employee_Earnings_2012.csv"), headers: true)



table.each{|row| row["REGULAR EARNINGS"] = row["REGULAR EARNINGS"].to_f}


table.delete_if{|row| row["OVERTIME EARNINGS"].to_f == 0 || row["EMPLOYEE NAME"].include?("JOHN") || row["DEPARTMENT NAME"] == "BUILDINGS AND COMPLIANCE"}



puts table.group_by {|row| row["DEPARTMENT NAME"]}.filter{|department, row_array| row_array.length > 150}.keys
