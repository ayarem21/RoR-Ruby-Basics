=begin
Дан целочисленный массив. Найти все нечетные элементы.
=end
a = [-1, 4, -2, 5, -8, 8, 7, -6]
k=0
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i]%2 == 1
    k=k+1
  end
end
puts k
