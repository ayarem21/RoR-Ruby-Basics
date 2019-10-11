=begin
Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.
=end
a = [-1, 4, -2, 5, -3, 6, 7, 0]
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i] < 0
    print a[i]=a.max,' '
  else
    print a[i],' '
  end
end
