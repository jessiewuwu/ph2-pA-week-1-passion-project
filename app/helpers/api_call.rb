require 'httparty'



def get_data
  response = HTTParty.get('https://www.googleapis.com/customsearch/v1?cx=016871532285775593244%3Ahitwjirk3ac&q=dog%20transparent%20gif&searchType=image&num=10&start=11&key=AIzaSyAy1FwWb_llGer7CJZk65r63ZidHFqdJ9Q')
  items = response["items"]
  items.map{|item| item["link"] }
end

p get_data



