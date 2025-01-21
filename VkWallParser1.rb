require 'httparty'

class VkWallParser1
  def initialize(access_token)
    @access_token = access_token
  end

  def getHoroscope
    response = HTTParty.get("https://api.vk.com/method/wall.get", query: {
      owner_id: "neural_horo",
      count: 3,
      access_token: @access_token,
      v: '5.131'
    })

    unless response.success?
      puts "Ошибка при получении данных: #{response.parsed_response['error']['error_msg']}"
      return nil
    end

    posts = response.parsed_response['response']['items']
    sorted_posts = posts.sort_by { |post| -post['date'] }
    latest_horoscope_post = sorted_posts.find do |post|
      contains_all_zodiac_signs(post['text'])
    end

    if latest_horoscope_post
      horoscopes = {}
      latest_horoscope_post['text'].split("\n").each do |h|
        sign_match = h.match(/♈️Овен|♉️Телец|♊️Близнецы|♋️Рак|♌️Лев|♍️Дева|♎️Весы|♏️Скорпион|♐️Стрелец|♑️Козерог|♒️Водолей|♓️Рыбы/)
        if sign_match
          sign_text = sign_match.to_s.gsub(/[^А-Яа-я]/, '').strip
          horoscopes[sign_text] = h.gsub(sign_match.to_s, '').strip
        end
      end
      horoscopes
    else
      puts "Не найдено подходящего поста с гороскопами"
      nil
    end
  end

  def contains_all_zodiac_signs(text)
    zodiac_signs = [
      "♈️Овен", "♉️Телец", "♊️Близнецы", "♋️Рак", "♌️Лев", "♍️Дева",
      "♎️Весы", "♏️Скорпион", "♐️Стрелец", "♑️Козерог", "♒️Водолей", "♓️Рыбы"
    ]
  
    zodiac_signs.all? { |sign| text.include?(sign) }
  end
end