=begin
Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.
=end
a = [-3, 7, -2, 1, -3, 7, 3, 3]
puts a[a.index(a.max),a.rindex(a.max)].size-2
