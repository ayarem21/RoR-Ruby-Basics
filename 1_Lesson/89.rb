=begin
Дан целочисленный массив. Найти все нечетные элементы.
=end
a = [-1, 4, -2, 5, -8, 8, 7, -5]
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i]%2 == 1
    print a[i], ' '
  end
end
