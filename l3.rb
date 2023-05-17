=begin
Прямоугольный треугольник. Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник прямоугольным (используя теорему Пифагора www-formula.ru), равнобедренным (т.е. у него равны любые 2 стороны)  или равносторонним (все 3 стороны равны) и выводит результат на экран. Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти самую длинную сторону (гипотенуза) и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон. Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.

=end

print "a:"
a = gets.to_f
print "b:"
b = gets.to_f
print "c:"
c = gets.to_f

if a**2 + b**2 == c**2
    puts "This is a rectangular triangle"
elsif a == b && a == c && b == c
    puts "This is an equilateral triangle"
elsif a == b || a == c || b == c
    puts "This is an isosceles triangle"
else
    puts "this some kind of triangle. I'm not familiar with..."
end
