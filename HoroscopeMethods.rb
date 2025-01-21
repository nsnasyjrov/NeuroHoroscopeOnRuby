require 'date'
require_relative 'VkWallParser1'

class HoroscopeMethods
  def initialize
    @zodiacSign = nil
    @horoscopes = {}
    # Впишите здесь актуальный inplicit access_token(обновляется каждые 24h, инструкция как получить в README)
    @parser = VkWallParser1.new("vk1.a.wkDYr9VKYsmAcNNAgNtpueU7okt78lCxICPn2p5-n2hflLKKed4PHTXhSw7vHoY1i1AxNeBjYjHlMJ8zhpsq-ox5y34ggenobGVKluvtEXM0AOSSWE--q8iyQ_XBtRAw0dBQQ3YxRMu7uVDgl1--XJIX9SlDTUkqdNP8kMtqv5S5P_-tc7G0QS7c_hrUgOKYkYJcaNJQ_VJv0ZEJ9nK0sA")
  end

def console_hello_menu
  puts "Здравствуйте, программа успешно запустилась!"
  ask_for_date
  fetch_horoscopes

  loop do
    puts "1 - ваш гороскоп на сегодняшний день"
    puts "2 - посмотреть общий гороскоп"
    puts "3 - прервать работу программы"
    print "Вы должны принять решение: "
    choice = gets.chomp.to_i

    case choice
    when 1
      show_daily_horoscope_for_user
    when 2
      show_all_horoscopes
    when 3
      puts "Работа программы завершена!"
      break
    end
  end
end

  def ask_for_date 
    loop do
      print "Введите дату рождения в dd.MM.yyyy: "
      birthday_input = gets.chomp
  
      begin
      birthday = Date.strptime(birthday_input, "%d.%m.%Y")
      @zodiacSign = getZodiacSign(birthday)
      puts "Ваш знак зодиака: #{@zodiacSign}" 
      break
      rescue
        puts "Некорректный формат даты. Пожалуйста, введите дату в формате dd.MM.yyyy."
      end
    end
  end

  def getZodiacSign(birthday)
     day = birthday.day
     month = birthday.month

    zodiac_signs = ["Козерог", "Водолей", "Рыбы", "Овен", "Телец", "Близнецы",
                "Рак", "Лев", "Дева", "Весы", "Скорпион", "Стрелец"]
    endDays = [19, 18, 20, 19, 20, 20, 22, 22, 22, 22, 21, 21]

    if day <= endDays[month - 1]
      zodiac_signs[month - 1]
    else
      zodiac_signs[month % 12]
    end
  end

  def zodiac_sign
    @zodiacSign
  end

  def fetch_horoscopes
    horoscopes = @parser.getHoroscope
    if horoscopes
      @horoscopes = horoscopes
    else
      puts "Не удалось получить гороскопы!"
    end
  end

  def show_daily_horoscope_for_user
    if @zodiacSign && @horoscopes.any?
      if @horoscopes.key?(@zodiacSign)
        puts "#{@zodiacSign}: #{@horoscopes[@zodiacSign]}"
      else
        puts "Гороскоп для вашего знака зодиака (#{@zodiacSign}) не найден."
      end
    else
      puts "Гороскопы не загружены или знак зодиака не определен."
    end
  end

  def show_all_horoscopes
    if @horoscopes.any?
      puts "Общий гороскоп на сегодня:"
      @horoscopes.each do |sign, text|
        puts "#{sign}: #{text}\n\n"
      end
    else
      puts "Гороскопы не загружены."
    end
  end
end



