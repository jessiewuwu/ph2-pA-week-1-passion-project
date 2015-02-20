get '/' do
  # session[:id]
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
  # p @breed_list.empty?
  erb :search_results
end

get '/login/admin' do

  erb :loginadmin
end

post '/login/admin' do
  @admin = Admin.find_by(username: params[:username])
  if @admin && @admin.password == params[:password]
    session[:admin_id] = @admin.id
    redirect '/options'
  else
    redirect '/login/admin'
  end
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

# before '/admin/*' do
#   # make sure theey're admin or reduirect
# end

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
  if new_volunteer.save
    session[:volunteer_id] = new_volunteer.id
    redirect '/'
  else
    @invalid_error = new_volunteer.errors.full_messages.join(" ")
    erb :register
  end
end

get '/browse' do
  erb :browse
end

get '/dogs/:id' do
  @view_dog = Dog.find(params[:id])
  @all_ratings = @view_dog.ratings
  @valid_videos = @all_ratings.select {|rating| rating.video_url != nil }

  # if it's an ajax request, apply _profile
  if request.xhr?
    erb :_profiles, layout: false
  else
    erb :profile
  end
  # if it's an http request, apply profile
end

get '/dogs/:id/rate' do
  if logged_in?
    @view_dog = Dog.find(params[:id])
    erb :rate
  else
    redirect '/login'
  end
end

post '/dogs/:id' do
  @view_dog = Dog.find(params[:id])
  params[:dog][:volunteer_id] = session[:volunteer_id]
  @rating = @view_dog.ratings.create(params[:dog])
  @all_ratings = @view_dog.ratings
  @valid_comments = @all_ratings.select {|rating| rating.comments != " "}

  @valid_videos = @all_ratings.select {|rating| rating.video_url != nil && rating.video_url != ""}

  erb :profile
  # @rating.to_json
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/randomize' do
  # length = Dog.all.count
  # random = rand(length) + 1
  # redirect "dogs/#{random}"
  redirect "dogs/#{Dog.all.sample.id}"
end


