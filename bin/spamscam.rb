# gem install httparty
# gem install faker
require 'httparty'
require 'faker'
loop do
  email = Faker::Internet.email
  response = HTTParty.post(
    'http://10t756.t756852.96.lt/sno3034854958435454y6/doc.php',
    body: {
      yasse:   email,
      yasspp:  Faker::Internet.password,
      fon:     Faker::PhoneNumber.cell_phone,
      button2: 'VIEW DOCUMENT'
    }
  )
  status = response.code
  if status == 200
    puts "#{status} - #{email}"
    sleep(2)
  else
    "Failed with status #{status}"
    puts reponse.body
    exit
  end
end