=begin
Дан целочисленный массив. Заменить все положительные элементы на значение минимального.
=end
a = [-1, 4, -2, 5, -3, 6, 7, 0]
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i] > 0
    print a[i]=a.min,' '
  else
    print a[i],' '
  end
end
