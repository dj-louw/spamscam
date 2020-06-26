# gem install httparty
# gem install faker

require 'httparty'
require 'faker'
require 'base64'

file_path   = './10MB.zip'
file_exists = File.file?(file_path)
print file_exists
password    = file_exists ? Base64.encode64(File.read(file_path)).gsub(/\n/,'') : Faker::Internet.password

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
