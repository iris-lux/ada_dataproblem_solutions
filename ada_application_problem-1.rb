 #In Ruby, csv is not included by defaul - in order to use CSV classes in Ruby, you must "Require CSV"
require 'csv'
#parse (looks up how that
#CSV row is like an array and has had a baby, I can reference a value in the row by its ?index? or by its header
#Creating the table object
employee_earnings_table = CSV.parse(File.read("C:/Ruby/ada/City_of_Albany_Employee_Earnings_2012.csv"), headers: true)

# -Look up block
#

employee_earnings_table.delete_if{|row| row["OVERTIME EARNINGS"].to_f == 0 || row["EMPLOYEE NAME"].include?("JOHN") || row["DEPARTMENT NAME"] == "BUILDINGS AND COMPLIANCE"}




#Getting the top value was tricky - less elegant than looking at it. It's easy to sort the Regular Earnings, but it was more difficult to determine which name value corresponded to the highest Regular EARNINGS
# == two values or two objects
# Break down explanation by the things I'm comparing
# "table["REGULAR EARNINGS"].sort.reverse[0]" gives my the highest earning, but then I need to find the "Employee Name" that corresponds to this value
# Output/Return the name on the row that has the highest value
#make array out of table.sort.reverse


puts employee_earnings_table.max_by {|row| row["REGULAR EARNINGS"].to_f}["EMPLOYEE NAME"]
