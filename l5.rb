=begin
    5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: docs.microsoft.com
    =IF(OR(MOD(A1,400)=0,AND(MOD(A1,4)=0,MOD(A1,100)<>0)),"Leap Year", "NOT a Leap Year")
=end

print "Enter a day: "
day = gets.chomp.to_i
print "Enter a month: "
month = gets.chomp.to_i
print "Enter a year: "
year = gets.chomp.to_i

calendar = {
    '01' => 31,
    '02' => 28, 
    '03' => 31, 
    '04' => 30, 
    '05' => 31,
    '06' => 30,
    '07' => 31,
    '08' => 31,
    '09' => 30,
    '10' => 31,
    '11' => 30,
    '12' =>31
}

leap_year = (year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0
calendar["02"] = 29 if leap_year

index_number = day

calendar.each do |mm, dd|
    if month.to_i < mm.to_i
    index_number += dd
    end
end

puts "Index number of your date: #{index_number}"

