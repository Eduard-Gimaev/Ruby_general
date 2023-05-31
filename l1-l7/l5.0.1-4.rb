
#1. Сделать хеш, содержащий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней ровно 30
calendar = {'January' => 31,'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31}

months_30 = []
months = {}
months = calendar.select{|m, d| d==31}
months.each do |month, day|
    months_30 << month
end

puts "Задание №1"
puts months_30
puts "=============================================================="

#2. Заполнить массив числами от 10 до 100 с шагом 5
arr1 = []
i = 10
while i < 100
    arr1 << i
    i += 5
end
puts "Задание №2"
puts "arr1 = #{arr1}"
puts "=============================================================="

#3. Заполнить массив числами фибоначчи до 100
first_num, second_num = 0, 1
fibonacci = []

100.times do
    fibonacci << first_num
    first_num, second_num = second_num, first_num + second_num
end
  
puts "Задание №3"
puts "#{fibonacci}"
puts "=============================================================="

#4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z').to_a
alphabet_vowels = ["a", "e", "i", "o", "u", "y"]
vowels = {}

alphabet.each_with_index do |letter, index|
  #puts "#{letter} => #{index}" 
  if alphabet_vowels.include?(letter)
    vowels[letter] = index+1 
  end
end
puts "Задание №4"  
puts vowels












