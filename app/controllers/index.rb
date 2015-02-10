get '/' do
  session[:id]
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

get '/login/admin' do

  erb :loginadmin
end

post '/login/admin' do
  @admin = Admin.find_by(username: params[:username])
  if @admin && @admin.password == params[:password]
    session[:admin_id] = @admin.id
  else
    redirect '/login/admin'
  end
  redirect '/options'
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
    @error = true
    erb :login
  end
  redirect '/'
end

get '/options' do
  @all_dogs = Dog.all.sort
  erb :options
end

post '/options' do
  @rate_this_dog = Dog.find(params[:id])

  redirect "/options/#{params[:id]}/change"
end

get '/options/:id/change' do
  @view_dog = Dog.find(params[:id])

  erb :changeprofile
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

delete '/dogs/:id/delete' do
  @delete_dog = Dog.find(params[:id])
  @delete_dog.destroy
  redirect '/options'
end

get '/register' do
  erb :register
end

post '/register' do
  new_volunteer = Volunteer.new(params)
  if new_volunteer.valid?
    new_volunteer.save
    redirect '/options'
  else
    @invalid_error = new_volunteer.errors.full_messages.join(" ")
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

get '/logout' do
  session.clear
  redirect '/'
end

get '/randomize' do
  length = Dog.all.count
  random = rand(length) + 1
  redirect "dogs/#{random}"
end


