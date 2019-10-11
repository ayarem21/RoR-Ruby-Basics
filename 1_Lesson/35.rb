=begin
Дан целочисленный массив. Найти индекс первого минимального элемента.
=end
a = [-1, -5, -2, -5, -3, 6, 7, -5]
minimum = a[0]
index = 0
a.index(a.first).upto(a.index(a.last)) do |i|
  if minimum > a[i]
     minimum = a[i]
     index = i

   end
end
puts 'Minimum:', minimum, 'Minimum index:', index
