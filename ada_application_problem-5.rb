require 'csv'
#Load CSV file into CSV:Table object, with headers
employee_earnings_table = CSV.parse(File.read("C:/Ruby/ada/City_of_Albany_Employee_Earnings_2012.csv"), headers: true)
#Filter the table so it does not contain names the name “JOHN”, employees who made zero overtime, or any “BUILDINGS AND COMPLIANCE” employees
employee_earnings_table.delete_if{|row| row["OVERTIME EARNINGS"].to_f == 0 || row["EMPLOYEE NAME"].include?("JOHN") || row["DEPARTMENT NAME"] == "BUILDINGS AND COMPLIANCE"}

ny_median_household_income = 60378.0
# Output departments that have employees earning more than $1,000 in longevity pay and earned more than the median household income in the State of New York in 2012
puts employee_earnings_table.group_by {|employee_row| employee_row["DEPARTMENT NAME"]}.filter{|department_name, department_table|
  sorted_totalearnings_array = department_table.collect{|employee_row| employee_row["TOTAL EARNINGS"].to_f}.sort
  department_table.collect{|employee_row| employee_row["LONGEVITY PAY"].to_f}.max > 1000 &&
  ((sorted_totalearnings_array[(sorted_totalearnings_array.length - 1) / 2] + sorted_totalearnings_array[sorted_totalearnings_array.length / 2]) / 2) > ny_median_household_income
                                                          }.keys
