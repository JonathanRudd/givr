require 'rest-client'
require 'base64'
require 'json'

class ImaggaService

  # def fetch_imagga(response_image)
  #   tf = Tempfile.open
  #   tf.write(response_image)

  #   image_results = ""
  #   File.open(tf.path) do |images_file|
  #     classes = get_classes(images_file)
  #     yield(classes)
  #   end
  #   # Do something with the image results
  #   p image_results
  #   tf.unlink
  # end

  def get_classes(image_url)
    api_key = "acc_ce22e515eab533e"
    api_secret = "e9fd89b7c25ce2d86e11a8242206c985"

    auth = 'Basic ' + Base64.strict_encode64( "#{api_key}:#{api_secret}" ).chomp

    response = RestClient.get "https://api.imagga.com/v2/tags?image_url=#{image_url}", { :Authorization => auth }
    response = JSON.parse(response)
    classes = response["result"]["tags"].map { |tag| tag["tag"]["en"]}
    # p "Recognition result:", classes
    # tag_array = ["kitchen", "apparel", "tools", "home entertainment", "game", "furniture", "game equipment", "leisure", "exercise", "sport"]
    # final_classes = classes.reject!  do |tag|
    #   tag_array.include?(tag)
    # end
    classes
  end

end
