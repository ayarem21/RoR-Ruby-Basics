=begin
Дан целочисленный массив. Найти два наибольших элемента.
=end
a = [-1, 4, -2, 5, -3, 6, 7, 0]
a = a.sort.uniq
puts a.pop
puts a.pop
