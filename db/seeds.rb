require 'open-uri'
require 'json'
require 'faker'

# Dog.create!(name: "Baby", breed: "Pekingese", description: "Sassy and always has her tongue sticking out.")

# Dog.create!(name: "Wilfur", breed: "Rottweiler-Corgi Mix", description: "Big head, stubby legs. Surprisingly good at balancing on two legs, but only when treats are involved.")

# Dog.create!(name: "Miguel", breed: "Chihuahua", description: "Miguel is like a cat: cool as a cucumber, gotta work a bit to get his love, but when you do, it's worth it.")

# Dog.create!(name: "Tomas", breed: "Chihuahua", description: "Miguel's twin brother. He loves attention and sleeping next to you in bed.")

Volunteer.create!(name: "Jessie", email: "jessie@wu.com", username: "jwu", password: "jessie")

Volunteer.create!(name: "Michelle", email: "michelle@gmail.com", username: "mish", password: "michelle")


Volunteer.create!(name: "Andrew", email: "andrew@gmail.com", username: "beard", password: "andrew")

Admin.create!(name: "Amadou", email: "amadou@mycode.com", password: "amadou", username: "admin")

Rating.create!(volunteer_id: 1, dog_id: 1, independent: "on", comments: "So cute!")

Rating.create!(volunteer_id: 2, dog_id: 4, affectionate: "on", chill: "on", independent: "on", comments: "Loves to politely ask for attention by pawing at your hand. He doesn't play much, but he does like to hang out next to you all day.")

def parse_dogs_json
  @dog_data = JSON.parse(IO.read('dogsData.json'))
end


# create dog records in our database
def seed_dogs(data)
  # data = @dog_data["collection1"]
  i = 0
  59.times do
    Dog.create(name: data[i]["dog_name"]["text"], breed: data[i]["breed"], image_link: data[i]["image"]["src"], description: Faker::Lorem.sentence(3), gender: data[i]["gender"])
    i+=1
  end
end

parse_dogs_json
seed_dogs(@dog_data["collection1"])

