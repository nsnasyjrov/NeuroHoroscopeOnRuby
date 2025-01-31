# Neurohoroscope

Проект **Neurohoroscope** — это Ruby-приложение, которое парсит гороскопы из социальной сети ВКонтакте и предоставляет их пользователю в удобном формате. Программа использует API ВКонтакте для получения постов со стены сообщества и извлекает тексты гороскопов для каждого знака зодиака.
Ссылка на группу, с которой взяты посты: https://vk.com/neural_horo
**ДЕВЕЛОХЕР НЕ ПРЕТЕНДУЕТ НА АВТОРСТВО НАД ПОСТАМИ** 
## Основная функциональность

1. **Парсинг гороскопов**:
   - Программа получает последние посты со стены сообщества ВКонтакте, используя API.
   - Извлекает тексты гороскопов для всех 12 знаков зодиака.

2. **Определение знака зодиака пользователя**:
   - Пользователь вводит свою дату рождения.
   - Программа определяет знак зодиака на основе введенной даты.

3. **Вывод гороскопа**:
   - Пользователь может получить гороскоп для своего знака зодиака.
   - Также доступен вывод всех гороскопов для всех знаков зодиака.

4. **Интерактивный интерфейс**:
   - Программа предоставляет простой консольный интерфейс для взаимодействия с пользователем.

## Как использовать

### Установка

1. Убедитесь, что у вас установлен Ruby (версия 3.0 или выше).
2. Склонируйте репозиторий:
   `git clone https://github.com/ваш-username/Neurohoroscope.git`
3. Создайте приложение в VkDev, получите ID и access_token(я использовал implicit flow)
- https://dev.vk.com/ru
Ссылка на получение access_token
- oauth.vk.com/authorize?client_id=52918695&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=wall,groups&response_type=token&v=5.131`class HoroscopeMethods
   ``` def initialize
    @zodiacSign = nil
    @horoscopes = {}
   Впишите здесь актуальный inplicit access_token(обновляется каждые 24h, инструкция как получить в README)
    @parser = VkWallParser1.new("ващ_access_token")
  end ```
4. В консоли `cd NeuroHoroscopeOnRuby` 
`ruby CLI.rb`
5. Следуйте инструкциям на экране:
- Введите дату рождения в формате dd.MM.yyyy.
- Выберите действие:
- Получить гороскоп для вашего знака зодиака.
- Посмотреть все гороскопы.
- Завершить работу программы.

**Концепции и технологии**:
В этом проекте я продемонстрировал следующие навыки и концепции

**Работа с API**:
Использование библиотеки HTTParty для отправки запросов к API ВКонтакте.
Обработка ответов от API и извлечение данных из JSON.
**Обработка дат**:
Использование класса Date для работы с датами.
Определение знака зодиака на основе даты рождения.
**Регулярные выражения:**
Использование регулярных выражений для извлечения знаков зодиака и текстов гороскопов из постов.
ООП (Объектно-ориентированное программирование):
Программа разделена на классы (VkWallParser, HoroscopeMethods), что делает код модульным и легко поддерживаемым.
Использование инкапсуляции и методов для организации логики.
Интерактивный интерфейс:
Реализация простого консольного интерфейса для взаимодействия с пользователем.
Работа с Git:
Проект размещен на GitHub, что демонстрирует навыки работы с системой контроля версий.
