=begin
Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять.
=end
a = [8, 4, 2, 5, 3, 6, 7, 1]
print a.first, ' '
a.index(a.first)+1.upto(a.index(a.last)-1) do |i|
  if a[i]%2 == 1
    print a[i]+=a.last,' '
  else
    print a[i],' '
  end
end
puts a.last
