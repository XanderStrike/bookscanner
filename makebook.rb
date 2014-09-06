`mkdir combined`

puts 'starting odd pages'
files = `ls odd`.split("\n")
n = 1
files.each do |f|
  number = n.to_s.rjust(5, "0")
  `cp odd/#{f} combined/#{number}.jpg`
  `mogrify -crop 3160x2384+912+669 -rotate 90 combined/#{number}.jpg`
  n += 2
  puts "moved #{f}"
end

puts 'starting even pages'
files = `ls even`.split("\n")
n = 0
files.each do |f|
  number = n.to_s.rjust(5, "0")
  `cp even/#{f} combined/#{number}.jpg`
  `mogrify -crop 3280x2520+528+576 -rotate 270 combined/#{number}.jpg`
  n += 2
  puts "moved #{f}"
end

puts 'final processing'
`mogrify -resize 25% combined/*.jpg`

puts 'outputting pdf'
`convert -limit memory 1 -limit map 1 combined/*.jpg book.pdf`
