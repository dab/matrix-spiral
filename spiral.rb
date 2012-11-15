def spiralP(width)

  # preparing emtpy 2D canvas for our spiral
  rows = cols = width  
  canvas = output = Array.new(rows) { Array.new(cols) }
  
  x = y = dx = n = 0
  dy = -1

  # searching for a central point, different for even/odd width
  half_width = width / 2
  if width % 2 == 0
    cx = half_width - 1
    cy = half_width
  elsif width % 2 == 1
    cx = cy = half_width
  end

  # going further step by step from the center
  for i in 0..width**2 do
    if ( -half_width < x ) and ( x <= half_width ) and ( -half_width < y ) and ( y <= half_width )
      canvas[cx + x][cy + y] = i + 1
    end
    if x == y or (x < 0 and x == -y) or (x > 0 and x == 1 - y)
      dx, dy = -dy, dx
    end
    x, y = x + dx, y + dy
  end
  return canvas
end

user_number = ARGV[0].to_i

number_sqr = Math.sqrt(user_number)
spiral = []
output = Array.new(number_sqr) { Array.new(number_sqr) }

if (number_sqr**2) == user_number
  spiral = spiralP(number_sqr)
  spiral.each do |s|
    s.compact!
  end
  # rearrange array
  width = n = number_sqr.to_i - 1
  i = j = 0
  while(n >= 0) do
    (0..width).each do |i|
      output[j][i] = spiral[i][n]
    end
    n -= 1
    j += 1
  end

  print "Input:\t\t#{user_number}\n"

  print "Output:"
  output.each do |row|
    print "\t"
    row.each do |col|
      print "\t#{col}"
    end
    print "\n"
  end

else
  puts "Wrong square\n"
end
