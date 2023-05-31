=begin
Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
  Если D > 0, то выводим дискриминант и 2 корня
  Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
  Если D < 0, то выводим дискриминант и сообщение "Корней нет"
Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru). Для вычисления квадратного корня, нужно использовать Math.sqrt
=end


print "enter a:"
a = gets.to_f
print "enter b:"
b = gets.to_f
print "enter c:"
c = gets.to_f

D = b**2 - 4*a*c

if  D > 0
    sqrt_D = Math.sqrt("#{D}".to_f)
    x1 = ((- b + sqrt_D)/2*a).round(2)
    x2 = ((- b - sqrt_D)/2*a).round(2)
    puts "The estimated discriminant is #{D} and the quadratic equation has two roots x1: #{x1} and x2: #{x2}  "
elsif
    D == 0
    sqrt_D = Math.sqrt("#{D}".to_f)
    x1 = ((- b + sqrt_D)/2*a).round(2)
    x2 = ((- b - sqrt_D)/2*a).round(2)
    puts "The estimated discriminant is #{D}, the quadratic equation has two roots with equal values: #{x1}"
elsif
    D < 0
    puts "The estimated discriminant is #{D}, so there are no roots here..."
else
    puts "I do not what is happening right now"
end

