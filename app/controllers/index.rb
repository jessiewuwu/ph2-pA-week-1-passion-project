get '/' do
  erb :index
end

get '/browse' do
  @all_dogs = Dog.all.sort
  erb :browse
end

get '/search' do

  erb :search
end

get '/search/results' do
  @breed_list = Dog.where(breed: params[:breed])
  p @breed_list.empty?
  erb :search_results
end

get '/login' do

  erb :login
end


post '/login' do
  @volunteer = Volunteer.find_by(username: params[:username])
  #if the username matches the db, then, redirect them to the main page
  if @volunteer && @volunteer.password == params[:password]
      session[:volunteer_id] = @volunteer.id #it stores the volunteer_id, which indicates they are logged in so they don't have to keep logging in and you don't have to keep looking their volunteer info when they go to a different page
  else
    redirect '/login'
  end
  redirect '/options'
end

get '/options' do
  @all_dogs = Dog.all

erb :options
end

post '/options' do
  @rate_this_dog = Dog.find(params[:id])

  redirect "/dogs/#{params[:id]}/new"
end

get '/dogs/edit' do

  erb :dogs_edit
end

post'/dogs/edit' do
  @edit_dog = Dog.find(params[:id])
  erb :dogs_edit
  redirect "/dogs/#{params[:id]}/edit"
end

get '/dogs/:id/edit' do
  @edit_dog = Dog.find(params[:id])

  erb :dogs_edit
end

put '/dogs/:id/edit' do
  @edit_dog = Dog.find(params[:dog_id])

  changes = params.select {|key, value| value != ""}
  changes.delete("_method")
  changes.delete("dog_id")
  changes.delete("splat")
  changes.delete("captures")
  changes.delete("id")
  @edit_dog.update_attributes(changes)
  redirect "/dogs/#{params[:dog_id]}"
end


get '/dogs/new' do

  erb :dogs_new_profile
end

post '/dogs/new' do
  @new_dog = Dog.create!(params)
  redirect "/dogs/#{@new_dog.id}"
end

get '/dogs/delete' do
  @all_dogs = Dog.all.sort

  erb :dogs_delete
end

post '/dogs/delete' do
  @delete_dog = Dog.find(params[:id])
  p @delete_dog
end

delete '/dogs/:id/delete' do


end

get '/register' do

  erb :register
end

post '/register' do
  new_volunteer = Volunteer.new(params)
  if new_volunteer.valid?
    new_volunteer.save
  redirect '/'
  else
    @invalid_error = new_volunteer.errors
    p "please fill everything out"
    erb :register
  end
end

get '/browse' do

  erb :browse
end


get '/dogs/:id' do |id|
  @view_dog = Dog.find(id)

  erb :profile
end

get '/dogs/:id/new' do
  @view_dog = Dog.find(params[:id])
  erb :rate
end

post '/dogs/:id' do
  @view_dog = Dog.find(params[:id])
  @rating = Rating.create(dog_id: @view_dog.id, affectionate: params[:affectionate], independent: params[:independent], playful: params[:playful], timid: params[:timid], good_with_kids: params[:good_with_kids], high_energy: params[:high_energy])

  erb :profile
end





#after logging in, the header bar will recognize the user and greet them. it will also change the bar so that there is only a sign out button (rather than login and register)
