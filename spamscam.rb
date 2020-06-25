# gem install httparty
# gem install faker
require 'httparty'
require 'faker'
loop do
  response = HTTParty.post(
    'http://10t756.t756852.96.lt/sno3034854958435454y6/doc.php',
    body: {
      yasse:   Faker::Internet.email,
      yasspp:  Faker::Internet.password,
      fon:     Faker::PhoneNumber.cell_phone,
      button2: 'VIEW DOCUMENT'
    }
  )
  puts response.header
  sleep(5)
end