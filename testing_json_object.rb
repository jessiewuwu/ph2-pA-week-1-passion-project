require 'open-uri'
require 'json'

def parse_dogs_json
  JSON.parse(IO.read('dogsData.json'))
end


# create dog records in our database
def seed_dogs
  i = 0


end
dog_data["collection1"][i]["dog_name"]["text"]
# p "------------------------------------------"

# File.open( 'dogsData.json', "r") do |f|
#   JSON.load(f)
# end
Dog.create(name: first_dog,  )
