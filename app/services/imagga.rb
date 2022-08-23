require 'rest-client'
require 'base64'
require 'json'

api_key = "acc_ce22e515eab533e"
api_secret = "e9fd89b7c25ce2d86e11a8242206c985"

auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp

image_url = "http://res.cloudinary.com/jh2tc/image/upload/v1/development/%23%3CActiveStorage::Attachment:0x00007fe77e468f80%3E"

response = RestClient.get "https://api.imagga.com/v2/tags?image_url=#{image_url}", { :Authorization => auth }
response = JSON.parse(response)
classes = response["result"]["tags"].map { |tag| tag["tag"]["en"]}
p "Recognition result:", classes
classes
