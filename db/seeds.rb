Dog.create!(name: "Baby", breed: "Pekingese", age: 10, description: "Sassy and always has her tongue sticking out.")

Dog.create!(name: "Wilfur", breed: "Rottweiler-Corgi Mix", age: 5, description: "Big head, stubby legs. Surprisingly good at balancing on two legs, but only when treats are involved.")

Volunteer.create!(name: "Jessie", email: "jessie@wu.com", username: "jwu", password: "jessie")

Volunteer.create!(name: "Michelle", email: "michelle@gmail.com", username: "mish", password: "michelle")

Dog.create!(name: "Miguel", breed: "Chihuahua", age: 1, description: "Miguel is like a cat: cool as a cucumber, gotta work a bit to get his love, but when you do, it's worth it.")

Dog.create!(name: "Tomas", breed: "Chihuahua", age: 1, description: "Miguel's twin brother. He loves attention and sleeping next to you in bed.")

Volunteer.create!(name: "Andrew", email: "andrew@gmail.com", username: "beard", password: "andrew")

Admin.create!(name: "Amadou", email: "amadou@mycode.com", password: "amadou", username: "admin")

Rating.create!(volunteer_id: 1, dog_id: 1, independent: "on", comments: "Baby is so cute! Her tongue is always sticking out so when she sleeps, her tongue gets all dry and shriveled up.")

Rating.create!(volunteer_id: 2, dog_id: 4, affectionate: "on", chill: "on", independent: "on", comments: "Tomas loves to politely ask for attention by pawing at your hand. He doesn't play much, but he does like to hang out next to you all day.")
