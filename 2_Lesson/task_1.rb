a =  [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14,
  126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16,
  139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
puts "Кількість елементів в масиві: #{a.size}"

print "Перевернутий масив: ", a.reverse
puts ''

puts "Максимальний елемент в масиві: #{a.max}"

puts "Мінімальний елемент в масиві: #{a.min}"

print "Сортування від меншого до більшого #{a.sort}"
puts ''

print "Сортування від меншого до більшого #{a.sort.reverse}"
puts ''

puts "Тільки парні елементи"
a.index(a.first).upto(a.index(a.last)) do |i|
  if(a[i] % 2 == 0)
    print a[i], ' '
  end
end

puts "Без остачі діляться на 3"
a.index(a.first).upto(a.index(a.last)) do |i|
  if(a[i] % 3 == 0)
    print a[i], ' '
  end
end
puts ''

puts "Без повторів #{a.uniq}"


puts 'Змінити мінімальний з максимальний містами'
  imin, imax = a.index(a.min), a.index(a.max)
  a[imin], a[imax] = a.max, a.min
  print a

puts ''
puts "Від початку до мінімального"
print a[0...a.index(a.min)]

puts ''
puts 'Знайти 3 мінімальних'
print a.sort.uniq[0..2]

puts ''

puts "Поділено на 10.0"
a.index(a.first).upto(a.index(a.last)) do |i|
  a[i] /= 10.to_f
  print a[i], ' '
end
