=begin
Дан целочисленный массив и число К. Если существует элемент, больший К, то вывести true;
в противном случае вывести false.
=end
a = [-1, 4, -2, 5, -8, 8, 7, -5]
k=7
bool = false
a.index(a.first).upto(a.index(a.last)) do |i|
  if a[i] > k
    bool=true
  else
    bool=false
  end
end
puts bool
