=begin
Дан целочисленный массив. Найти все четные элементы.
=end
a = [-1, 4, -2, 5, -8, 8, 7, -5]
puts a.select{ |i| i%2 == 0}