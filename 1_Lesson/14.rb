=begin
Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию.
=end
a = [-1, 4, -2, 5, -3, 6, 7, 0]
temp = a.last
print temp, ' '
a.index(a.first).upto(a.index(a.last)-1) do |i|
  print a[i],' '
end
