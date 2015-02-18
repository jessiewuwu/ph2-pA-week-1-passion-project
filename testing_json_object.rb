require 'open-uri'
require 'json'

def parse_dogs_json
  @dog_data = JSON.parse(IO.read('dogsData.json'))
end


# create dog records in our database
def seed_dogs(data)
  # data = @dog_data["collection1"]
  data.map_with_index do | dog ,index |
    dog_name_string = dog["dog_name"]["text"]#["image"]["src"]
    Dog.create(name: dog_name_string )
  end

end

parse_dogs_json
p seed_dogs(@dog_data["collection1"])
# [i]["dog_name"]["text"]
# p "------------------------------------------"

# File.open( 'dogsData.json', "r") do |f|
#   JSON.load(f)
# end
