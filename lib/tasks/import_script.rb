adding_bin = 0
File.open("../jpmc_2013.csv") do |record|
  record.each do |record_actual|
    if record_actual[/Chase/] && record_actual[/CREDIT/] && record_actual[/SYSTEMS/]
      adding_bin += record_actual.split(',')[3].to_i
    end
  end
end

puts adding_bin

