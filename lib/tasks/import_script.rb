File.open("../jpmc_2013.csv") do |record|
  record.each do |record_actual|
    puts record_actual
  end
end
