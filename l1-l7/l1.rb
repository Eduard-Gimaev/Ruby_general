=begin
    Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле (<рост> - 110) * 1.15, после чего выводит результат пользователю на экран с обращением по имени. Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"
rescue => exception
=end

print "Your name: "
name = gets.chomp.capitalize
print "Your height: "
height = gets.chomp.to_i
weight = ((height - 110)*1.15).to_f.round(2)

puts "#{weight}kg"

puts"=================="
puts "#{name}, look at your weight: #{weight}kg"
puts"=================="
if weight < 0
    puts "Ваш вес уже оптимальный"
else
    print "#{weight}kg"
end



