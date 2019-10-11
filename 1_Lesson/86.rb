=begin
Дан целочисленный массив. Найти среднее арифметическое его элементов.
=end
a = [-1, 4, -2, 5, -3, 6, 7, 0]
summ = 0
a.index(a.first).upto(a.index(a.last)) do |i|
  summ=summ+a[i]
end
print summ.to_f/(a.index(a.last)+1)
