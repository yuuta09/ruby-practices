require "date"
require "optparse"

opt = OptionParser.new

opt.on('-y')
opt.on('-m')
opt.parse!(ARGV)

today = Date.today

year  = ARGV[0] || today.strftime("%Y")
month = ARGV[1] || today.strftime("%m")

start_day = Date.new(year.to_i, month.to_i)
last_day = Date.new(year.to_i, month.to_i, -1)

puts "       #{month}月 #{year}"
puts " 日 月 火 水 木 金 土"

(start_day..last_day).each do |n|
  day = n.strftime("%e").rjust(3)
  if n.strftime("%e") == " 1"
    day = day.rjust((n.wday + 1) * 3)
  end
  if n.saturday?
    puts day
  else
    print day
  end
end
puts ""

