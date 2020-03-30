#Load csv library
require 'csv'
#Load CSV file into CSV:Table object, with headers
employee_earnings_table = CSV.parse(File.read("C:/Ruby/ada/City_of_Albany_Employee_Earnings_2012.csv"), headers: true)
#Filter the table so it does not contain names the name “JOHN”, employees who made zero overtime, or any “BUILDINGS AND COMPLIANCE” employees
employee_earnings_table.delete_if{|row| row["OVERTIME EARNINGS"].to_f == 0 || row["EMPLOYEE NAME"].include?("JOHN") || row["DEPARTMENT NAME"] == "BUILDINGS AND COMPLIANCE"}
#Output number of departments withmore than 150 employees.
puts employee_earnings_table.group_by {|row| row["DEPARTMENT NAME"]}.filter{|department, row_array| row_array.length > 150}.keys.length
