# makebook.rb
#  alex standke - 2014
#   takes odd and even photos and turns them into a book
#   works well with diy book scanners

# variables

odd_rotation = 90
odd_x_offset = 912
odd_y_offset = 669
odd_x_crop = 3160
odd_y_crop = 2384

even_rotation = 270
even_x_offset = 528
even_y_offset = 576
even_x_crop = 3280
even_y_crop = 2520

resize = 25 # percent

# here we go

`mkdir combined`

puts 'starting odd pages'
files = `ls odd`.split("\n")
n = 1
files.each do |f|
  number = n.to_s.rjust(5, "0")
  `cp odd/#{f} combined/#{number}.jpg`
  `mogrify -crop #{odd_x_crop}x#{odd_y_crop}+#{odd_x_offset}+#{odd_y_offset} -rotate #{odd_rotation} combined/#{number}.jpg`
  n += 2
  puts "moved #{f}"
end

puts 'starting even pages'
files = `ls even`.split("\n")
n = 0
files.each do |f|
  number = n.to_s.rjust(5, "0")
  `cp even/#{f} combined/#{number}.jpg`
  `mogrify -crop #{even_x_crop}x#{even_y_crop}+#{even_x_offset}+#{even_y_offset} -rotate #{even_rotation} combined/#{number}.jpg`
  n += 2
  puts "moved #{f}"
end

puts 'final processing'
`mogrify -resize #{resize}% combined/*.jpg`

puts 'outputting pdf'
`convert -limit memory 1 -limit map 1 combined/*.jpg book.pdf`

print 'clean up? [yN] '
gets r
`rm -rf combined` r.downcase == 'y'

puts 'all done, look at book.pdf'
