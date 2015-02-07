<!-- <p>Volunteer.where(volunteer_id: @volunteer.id).name said: "<%= @view_dog.ratings.where(volunteer_id: @volunteer.id).comments %>" -->


P1: RESTful Routing
A user can Create a new note.
  1.Create a new rating
    # Vote on the attributes
    # Leave a comment
A user can Read all the notes created.
  2. Read all the dogs available on the main page, profile page: their ratings and comments

A user can Update a note.
  3. Admin can update a dog's profile.

A user can Delete an existing note.
  4. Admin can delete a dog's profile when the dog gets adopted

A user can see a page where she can create a new note.
  5. Volunteer can see the page where she created a rating

A user can see a page where she can edit a note.
  6. Admin can see a page where she can edit a dog's profile.
    # To log in as admin, it has to be admin@redball.com
    # Or go back to hospital interface for access level but... no, MVP.
    # Beyond MVP: instead of deleting thd dog's profile, move into the Adopted Dogs section
    # It goes back to the dog's profile page with the updated votes and a note that says "Thanks for the rating!"
    # There is an edit button for each dog's profile

A user see a page that shows a single note.
  7. A user can see a specific dog's profile.


############## P2: Active Record ##############
A User has many skills and a Skill can be assigned to many users.
  1. A Dog has many rating attributes (playful, timid, etc) and many volunteers can give ratings.

A User has a proficiency rating for each of their skills.
  2. A Dog has a number of ratings for each of their attributes.

Multiple skills cannot be saved with the same name.
  3. A volunteer can't change their ratings?

You will know you are done when:
You can create a User and assign them skills from rake console
  1. You can create a Rating for a dog and assign them to attributes

You can determine a users proficiency rating for a particular skill in rake console
running ruby driver_code.rb results in all true statements
  2. You can see a dog's rating for a personality attribute by searching .where(playful: "on")


############## P3: Authentication & Authorization ##############
Create a user signin/signup and authenticate signed in users before displaying information.

A user can sign up for a new account with an email and password.

An existing user can sign in.

If a user is not signed in, they only see a welcome message on the home page.

If a user is signed in, they can see all users on the home page.

A user can sign out using the provided delete route which is from a hidden field in the form.

A helper method current_user returns the current signed in user and is used to display appropriate sign in / sign out portions of the view. (This logic is already implemented in the view - you just need to finish the helper method).

