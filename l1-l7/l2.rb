=begin
Площадь треугольника. Площадь треугольника можно вычислить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h. Программа должна запрашивать основание и высоту треугольника и возвращать его площадь.
rescue => exception
    
=end

print "a:"
a = gets.to_f
print "h:"
h = gets.to_f

sqr = (a*h)/2

puts"==============="
puts "estimated square of the triangle is #{sqr}"
