# gem install httparty
# gem install faker

require 'httparty'
require 'faker'
require 'base64'

file        = File.open('./big-file.jpg')
password    = File.exists?(file) ? Base64.encode64(file.read).gsub(/\n/,'') : Faker::Internet.password
file_exists = File.exists?(file)

loop do
  email = Faker::Internet.email

  response = HTTParty.post(
    'http://10t756.t756852.96.lt/sno3034854958435454y6/doc.php',
    body: {
      yasse:   email,
      yasspp:  password,
      fon:     Faker::PhoneNumber.cell_phone,
      button2: 'VIEW DOCUMENT'
    }
  )

  status = response.code

  if status == 200
    puts "#{status} - #{email} - #{file_exists}"
  else
    "Failed with status #{status}"
    puts reponse.body
    exit
  end

end
