require 'sinatra'
require 'sinatra/reloader' if development?
require 'yaml'

class Pet
  attr_accessor :name
  attr_accessor :kind_of_animal
  attr_accessor :hungry
  attr_accessor :sleep
  attr_accessor :sleep_indicator
  attr_accessor :mood
  attr_accessor :toilet
  attr_accessor :hygiene_indicator
  attr_accessor :life
  attr_accessor :dont_want
  attr_accessor :name_kind_var
  attr_accessor :str_stat_want
  attr_accessor :life_left

  def initialize
    yml = YAML.load(File.read('db.yml'))
    @name = yml[:name]
    @kind_of_animal = yml[:kind_of_animal]
    @hungry = yml[:hungry]
    @sleep_indicator = yml[:sleep_indicator]
    @mood = yml[:mood]
    @toilet = yml[:toilet]
    @hygiene_indicator = yml[:hygiene_indicator]
    @life = yml[:lifes]
    @sleep = false
  end

  def get_food
    if @hungry < 7
      puts "#{@name_kind_var} не хоче їсти."
      @dont_want = "#{@name_kind_var} doesn't want to eat."
    else
      @dont_want = "You are feeding #{@name_kind_var}"
      @hungry = 0
    end
    timer_emulation
    want_sleep
  end

  def go_toilet
    if @toilet < 6
      puts "#{@name_kind_var} не хоче в туалет"
      @dont_want = "#{@name_kind_var} doesn't want to go to the toilet"
    else
      @toilet = 0
      @dont_want = "You put the #{@name_kind_var} in the toilet"
    end
    timer_emulation
    want_sleep
  end

  def sleeping
    @dont_want = "You were put to bed #{@name_kind_var}."
    i = 0
    while i != 3 do
      i += 1
      @sleep_indicator = 0
      timer_emulation
      end
    @dont_want += "<p> #{@name_kind_var} he(she) woke up. </p>"
  end

  def go_to_wash
    @hygiene_indicator = 0
    @dont_want = "you helped take a bath #{@name_kind_var}"
    timer_emulation
    want_sleep
  end

  def up_mood
    if @mood > 7
      puts "#{@name_kind_var} не хоче зараз гратись"
      @dont_want = "#{@name_kind_var} does not want play now"
    else
      puts "Ви погрались з #{@name}."
      @dont_want = "You played with #{@name_kind_var}"
      @mood = 10
    end
    timer_emulation
    want_sleep
  end

  private


  def hungry_pet?
    @hungry >= 8
  end

  def want_sleep
    if @sleep_indicator > 9
      @str_sleep_want = "#{@name_kind_var} fell asleep."
      @sleep_indicator = 0
      end
    end

  def timer_emulation
    if @hungry < 10
      @hungry += 1
    else
      @life -= 1
      puts "you have left #{@life} lifes"
      @life_left = "You have left #{@life} lifes"
      @hungry = 0
      if @life.zero?
        @life_left = "#{@name_kind_var} escaped from you"
        redirect '/'
      end
    end
    if @toilet < 10
      @toilet += 1
    end
    if @toilet >= 6
      @toilet_text = "#{@name_kind_var} want go to the toilet.\n"
    else
      @toilet_text = ''
    end

    if @toilet >= 10
      @wash_text = "Oops, need in the bathroom(toilet indicator: #{@toilet})"
      @toilet = 0
      @hygiene_indicator = 10
    else
      @wash_text = ''
    end
    if hungry_pet?
       @hungry_text = "#{@name_kind_var} want eat\n"
    else
      @hungry_text = ''
    end

    if @sleep_indicator > 7
      @sleep_text = "#{@name} want sleep.\n"
    else
      @sleep_text = ''
    end

    if @sleep_indicator <= 10
      @sleep_indicator += 1
    end

    if @hygiene_indicator <10
      @hygiene_indicator += 1
    else
      @life -= 1
      puts "У тебе залишилось #{@life} життя"
      @life_left = "You have left #{@life} lifes"
      @hygiene_indicator = 0
      if @life.zero?
        puts "Молодець, треба було допомагати купатись #{@kind_of_animal}(у)"
        @life_left = "#{@name_kind_var} escaped from you"
        redirect '/'
      end
    end

    if @hygiene_indicator > 7
      @wash_text = "#{@name_kind_var} want go to bathroom.\n"
    else
      @wash_text = ''
    end

    if @mood.positive?
      @mood -= 1
    else
      @life -= 1
      puts "У тебе залишилось #{@life} життя"
      @life_left = "You have left #{@life} lifes"
      @mood = 0
      if @life.zero?
        puts "Молодець, від тебе втік(ла) #{@kind_of_animal}"
        @life_left = "#{@name_kind_var} escaped from you"
        redirect '/'
      end
    end
    if @mood < 4
      @mood_text = "#{@name_kind_var} want play\n"
    else
      @mood_text = ''
    end

    @str_stat_want = "#{@toilet_text} <p>#{@hungry_text}</p>
    #{@wash_text} <p>#{@mood_text}</p> #{@str_sleep_want}"

  end
end



get '/' do
  erb :index
end

pet = Pet.new

post '/game' do
  pet = Pet.new
  our_pet = { name: params[:name].to_s,
              kind_of_animal: params[:kind].to_s,
              hungry: 0,
              sleep_indicator: 0,
              mood: 10,
              toilet: 0,
              hygiene_indicator: 0,
              lifes: 3  }
  File.open('db.yml', 'w') { |file| file.write(our_pet.to_yaml) }
  @name_kind_var = "#{params[:kind].to_s} #{params[:name].to_s}"
  pet.name_kind_var = @name_kind_var
  erb :greeting
end

post '/game/play' do
  @hungry_stat = pet.hungry
  @toilet_stat = pet.toilet
  @sleep_stat = pet.sleep_indicator
  @wash_stat = pet.hygiene_indicator
  @mood_stat = pet.mood
  @dont_want = pet.dont_want
  @lifes_stat = pet.life
  @str_stat_want = pet.str_stat_want
  erb :game
end

post '/game/play/get_food' do
  pet.get_food
  redirect '/game/play', 307
end
post '/game/play/go_toilet' do
  pet.go_toilet
  redirect '/game/play', 307
end
post '/game/play/go_sleep' do
  pet.sleeping
  redirect '/game/play', 307
end

post '/game/play/go_to_wash' do
  pet.go_to_wash
  redirect '/game/play', 307
end

post '/game/play/play_with_animal' do
  pet.up_mood
  redirect 'game/play', 307
end