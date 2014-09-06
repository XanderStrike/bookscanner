`mkdir combined`

files = `ls odd`.split("\n")
n = 1
files.each do |f|
  `cp odd/#{f} combined/#{n}.jpg`
  `mogrify -trim +repage -rotate 90 combined/#{n}.jpg`
  n += 2
  puts "moved #{f}"
end

files = `ls even`.split("\n")
n = 0
files.each do |f|
  `cp even/#{f} combined/#{n}.jpg`
  `mogrify -trim +repage -rotate 270 combined/#{n}.jpg`
  n += 2
  puts "moved #{f}"
end
