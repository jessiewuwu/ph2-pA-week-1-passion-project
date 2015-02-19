require 'spec_helper'

describe 'GET /browse' do

  before do
    Dog.delete_all
  end

  it 'should give the number of dogs displayed' do
    new_dog = Dog.create(name: "rover", breed: "whatever", description: "stuff", image_link:"www", gender: "f")
    get '/browse'
    expect(last_response.body).to include('rover')
  end
end