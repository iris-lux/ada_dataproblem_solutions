#Load csv library
require 'csv'
#Load CSV file into CSV:Table object, with headers
employee_earnings_table = CSV.parse(File.read("C:/Ruby/ada/City_of_Albany_Employee_Earnings_2012.csv"), headers: true)
#Load mayors total earnings
mayors_total_earnings = employee_earnings_table.find {|row| row["TITLE"] == "MAYOR"}["TOTAL EARNINGS"].to_f
#Filter the table so it does not contain names the name “JOHN”, employees who made zero overtime, or any “BUILDINGS AND COMPLIANCE” employees
employee_earnings_table.delete_if{|row| row["OVERTIME EARNINGS"].to_f == 0 || row["EMPLOYEE NAME"].include?("JOHN") || row["DEPARTMENT NAME"] == "BUILDINGS AND COMPLIANCE"}
#Output fire department employees whose first names do not begin with “R” made more than the mayor of Albany in 2012 in total earnings
puts employee_earnings_table.select{|row| (row["DEPARTMENT NAME"] == "FIRE DEPARTMENT") && !row["EMPLOYEE NAME"].match?(/(^[^,]*,(R.*),)/) && (row["TOTAL EARNINGS"].to_f > mayors_total_earnings)}.collect{|row| row["EMPLOYEE NAME"]}
