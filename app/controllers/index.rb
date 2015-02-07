get '/' do
  @all_dogs = Dog.all
  erb :index
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




