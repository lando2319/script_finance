# tax calculation for 2013
# > load 'lib/tasks/2013_taxes.rb'

puts "Income for 2013"
puts "--------------"



game_time = 0
File.open("../jpmc_2013.csv") do |record|
  record.each do |record_actual|
    if record_actual[/Chase/] && record_actual[/CREDIT/] && !record_actual[/PRISCILLA/]
      puts record_actual
      game_time += record_actual.split(',')[3].to_i
    end
  end
end

# additional income not on Chase. Expenses Spreadsheet Lines 3-6, 11-12, 25, 40
game_time += 1135


puts "Gross Income in 2013"
puts game_time
puts "--------------"

wages_bin = 0
File.open("../jpmc_2013.csv") do |record|
  record.each do |record_actual|
    if record_actual[/Chase/] && record_actual[/DEBIT/] && record_actual[/Dorrance/]
      wages_bin += record_actual.split(',')[3].to_i
      puts record_actual
    elsif record_actual[/Chase/] && record_actual[/DEBIT/] && record_actual[/NEUVOCREATE/]
      wages_bin += record_actual.split(',')[3].to_i
      puts record_actual
    elsif record_actual[/Chase/] && record_actual[/DEBIT/] && record_actual[/Maher/]
      wages_bin += record_actual.split(',')[3].to_i
      puts record_actual
    end
  end
end

puts "Total Wage Expense in 2013"
puts wages_bin
puts "--------------"

expenses_bin = 0
File.open("../jpmc_2013.csv") do |record|
  record.each do |record_actual|
    if record_actual[/1871/] 
      puts record_actual
      expenses_bin += record_actual.split(',')[3].to_i
    end
  end
end
puts "Total Office Expense"
puts expenses_bin
puts "--------------"

expense_bin_wifi = 0
File.open("../jpmc_2013.csv") do |record|
  record.each do |record_actual|
    if record_actual[/CLEAR/]
      puts record_actual
      expense_bin_wifi += record_actual.split(',')[3].to_i
    end
  end
end
  puts "total Wifi Expense"
  puts expense_bin_wifi

puts "--------------"
puts "Total Expenses"
puts expenses_bin + expense_bin_wifi + wages_bin

puts "--------------"

puts "Balance"
puts game_time + expenses_bin + wages_bin + expense_bin_wifi
puts "--------------"
