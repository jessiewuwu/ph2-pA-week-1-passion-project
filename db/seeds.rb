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

Rating.create!(volunteer_id: 1, dog_id: 1, independent: "on", comments: "So cute!", video_url: "https://www.youtube.com/watch?v=nDJAIPliZLI")

Rating.create!(volunteer_id: 2, dog_id: 4, affectionate: "on", chill: "on", independent: "on", comments: "Loves to politely ask for attention by pawing at your hand. He doesn't play much, but he does like to hang out next to you all day.")

def parse_dogs_json
  @dog_data = JSON.parse(IO.read('dogsData.json'))
end


# create dog records in our database
def seed_dogs(data)
  # data = @dog_data["collection1"]
  i = 0
  59.times do
    Dog.create(name: data[i]["dog_name"]["text"], breed: data[i]["breed"], image_link: data[i]["image"]["src"], description: Faker::Lorem.sentence(3), gender: data[i]["gender"], direct_url: data[i]["dog_name"]["href"])
    i+=1
  end
end


def seed_ratings(traits, comments)

  50.times do
   Rating.create(dog_id: rand(55), comments: comments.sample, affectionate: traits.sample, playful: traits.sample, good_with_kids: traits.sample, chill: traits.sample, independent: traits.sample, timid: traits.sample, high_energy: traits.sample)
  end


end

random_traits = ["on", nil]
comments = ["It is so cute when it sleeps!", "It loves to go on long walks.", "It doesn't really like other dogs, it likes all the attention to itself", "It likes to sleep all day", "Aw, my favorite dog to take out for hikes!", "It needs some training with the leash but other than that, it's the perfect dog!", "I want to squeeze it to death...","It snores when it dreams!", "Kinda smelly, but that's okay.", "It has the biggest puppy eyes ever.", "not very smart but really cute.", "Likes to give big sloppy kisses.", "So adorable!", "Really smart. Knows how to sit, shake, lie down, fetch, and play dead.", "Really funny dog who likes to watch tv next to you", "Sloppy eater, sloppy kisses.", "Really fat, likes to steal food when you're not looking."]



parse_dogs_json
seed_dogs(@dog_data["collection1"])

seed_ratings(random_traits, comments)

