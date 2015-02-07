get '/' do
  @all_dogs = Dog.all
  erb :index
end

get '/login' do

  erb :login
end

post '/login' do
  @volunteer = Volunteer.find_by(username: params[:username])
  #if the username matches the db, then, redirect them to the main page
  if @volunteer
    if @volunteer.password != params[:password]
      @error = "Wrong password"
      erb :login
    else
      session[:username] = params[:username] #it stores the username, which indicates they are logged in so they don't have to keep logging in and you don't have to keep looking their volunteer info when they go to a different page

      redirect '/'
    end
  else
    redirect '/login'
  end
end

get '/register' do

  erb :register
end

post '/register' do
  p params
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

get '/dogs/:id' do |id|
  @view_dog = Dog.find(id)

  erb :profile
end

get '/dogs/:id/new' do |id|
  @rate_dog = Dog.find(id)

  erb :rate
end


post '/dogs/:id/new' do
  @dog = Dog.find(params[:id])
  @rating = Rating.create(dog_id: @dog.id, affectionate: params[:affectionate], independent: params[:independent], playful: params[:playful], timid: params[:timid], good_with_kids: params[:good_with_kids], high_energy: params[:high_energy])

  #need to redirect to profile page with new ratings added, right now it redirects to blank dogs/:id/new
end





#after logging in, the header bar will recognize the user and greet them. it will also change the bar so that there is only a sign out button (rather than login and register)
