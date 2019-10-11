=begin
Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными.
=end
a = [8, 3, 1, 5, 3, 1, 7, 0]
line  = ""
a.each do |i|
  if i%2==1
    line += a[i].to_s + " "
  end
end
a.each do |i|
  if i%2==0
    line += a[i].to_s + " "
  end
end
array = []
array = line.split(' ')
puts array.to_i
