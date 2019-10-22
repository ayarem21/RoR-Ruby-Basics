class Pet

  def initialize name, kind_of_animal
    @name = name
    @kind_of_animal = kind_of_animal
    @hungry = 0
    @sleep = false
    @sleep_indicator = 0
    @mood = 10
    @toilet = 0
    @hygiene_indicator = 0
    @life = 3
    puts @kind_of_animal + " " + @name + " народився."
  end

  def get_food
     if @hungry < 7
       puts "#{@name} не хоче їсти."
    else
      puts "Ви годуєте " + @name
      @hungry = 0
    end
    timer_emulation
    want_sleep
  end

  def go_toilet
    if @toilet < 6
      puts "#{@kind_of_animal} #{@name} не хоче в туалет"
    else
      @toilet = 0
      puts "Ви зводили #{@name}(a) в туалет"
    end
    timer_emulation
    want_sleep
  end

  def stat_pet
    puts ''
    puts "Показник голоду #{@hungry}"
    puts "Показник хотіння в туалет #{@toilet}"
    puts "Показник хотіння спати #{@sleep_indicator}"
    puts "Показник гігієни #{@hygiene_indicator}"
    puts "Показник настрою #{@mood}"
    puts ''
  end

  def sleeping
    puts "Ви поклали спати #{@kind_of_animal}"
    @sleep = true
    i = 0
    while i != 3 do
      i += 1
      if @sleep
        @sleep_indicator = 0
        timer_emulation
      end
      if @sleep
        puts "#{@kind_of_animal} спить."
      end
    end
    if @sleep
      @sleep = false
      puts "#{@kind_of_animal} прокинувся."
    end
  end

  def go_to_wash
    @hygiene_indicator = 0
    puts "Ви допомогли прийняти ванну #{@name}(у)"
    timer_emulation
    want_sleep
  end

  def up_mood
    if @mood > 7
      puts "#{@name} не хоче зараз гратись"
    else
    puts "Ви погрались з #{@name}."
    @mood = 10
    end
  timer_emulation
  want_sleep
  end

  private


  def hungry_pet?
    @hungry >=8
  end

  def want_sleep
    if @sleep_indicator >= 10 && @sleep == false
      puts "#{@name} заснув."
      @sleep_indicator = 0
      @sleep = true
    end
    @slepp = false
  end

  def timer_emulation

    if @hungry < 10
      @hungry += 1
    else
      @life -= 1
      puts "У тебе залишилось #{@life} життя"
      @hungry = 0
      if @life == 0
        puts "Молодець, тебе з'їв(ла) #{@kind_of_animal}"
        exit
      end
    end
    if @toilet < 10
      @toilet += 1
    end
    if @toilet >= 6
      puts "Зводіть #{@name}(a) в туалет."
    end
    if @toilet >= 10
      #puts "#{@name} образився(лась) і втік(втекла)"
      #exit
      puts "У-у-упс, треба в ванну кімнату, дуже швидко(Індикатор туалету #{@toilet})"
      @toilet = 0
      @hygiene_indicator = 10
    end
    if hungry_pet?
      puts "Погодуйте #{@name}(а)!"
    end

    if @sleep_indicator > 7
      puts "#{@name} хоче спати."
    end

    if @sleep_indicator <= 10
       @sleep_indicator += 1
    end

    if @hygiene_indicator <10
      @hygiene_indicator += 1
    else
      @life -= 1
      puts "У тебе залишилось #{@life} життя"
      @hygiene_indicator = 0
      if @life == 0
        puts "Молодець, треба було допомагати купатись #{@kind_of_animal}(у)"
        exit
      end
    end

    if @hygiene_indicator > 7
      puts "#{@name} хоче прийняти ванну."
    end

    if @hygiene_indicator >10
      puts "Треба зводити тваринку в ванну кімнату"
    end

    if @mood > 0
      @mood = @mood -1
    else
      @life -= 1
      puts "У тебе залишилось #{@life} життя"
      @mood = 0
      if @life == 0
        puts "Молодець, від тебе втік(ла) #{@kind_of_animal}"
        exit
      end
    end
    if @mood < 4
      puts "#{@name} хоче пограться"
    end
  end
end

puts "Вибери свою тваринку(1 - Кіт, 2 - Собака, 3 - Хом'як): "
x = gets.to_i
kind_of_animal = ""
case x
when 1
  kind_of_animal = "Кіт"
when 2
  kind_of_animal = "Собака"
when 3
  kind_of_animal = "Хом'як"
end

puts "Введіть ім'я майбутньої тваринки: "
pet_name = gets.chomp
pet = Pet.new pet_name, kind_of_animal
x=0
puts ''
puts "Інструкція!"
puts "1. Нагодувати тваринку."
puts "2. Відвести в туалет."
puts "3. Покласти спати."
puts "4. Погратись."
puts "5. Прийняти ванну"
puts "6. Статистика"
puts "7. Help."
puts "8. Exit."
puts ''
while x !=8 do
  x = gets.to_i
  case x
  when 1
    pet.get_food
  when 2
    pet.go_toilet
  when 3
    pet.sleeping
  when 4
    pet.up_mood
  when 5
    pet.go_to_wash
  when 6
    pet.stat_pet
  when 7
    puts ''
    puts "Інструкція!"
    puts "1. Нагодувати тваринку."
    puts "2. Відвести в туалет."
    puts "3. Покласти спати."
    puts "4. Погратись."
    puts "5. Прийняти ванну"
    puts "6. Статистика"
    puts "7. Help."
    puts "8. Exit."
    puts ''
  end
end
