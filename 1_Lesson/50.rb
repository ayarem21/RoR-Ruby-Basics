=begin
Дан целочисленный массив. Найти количество элементов, расположенных перед первым максимальным.
=end
a = [-1, 4, -2, 5, 8, 6, 7, -5]
puts a[0...a.index(a.max)].size