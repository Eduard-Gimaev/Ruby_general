=begin
Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:

Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

hash   = keys.zip(values).to_h
[keys, values].transpose.to_h
    
=end

order = {}
total = 0

while true
print "What product do you want: "
product = gets.chomp
if product == "stop" || product == ""
    puts "thanks, for your order"
    break
end
print "How many do you want: "
quantity = gets.chomp.to_i
print "Feel free, just put your price: "
price = gets.chomp.to_f
order[product]={price: price, quantity: quantity, sum: price * quantity}
total += price * quantity
end

puts "================================"
puts order
puts "Total price: #{total} EUR"