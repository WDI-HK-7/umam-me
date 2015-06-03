require 'open-uri'

namespace :scrape do

  desc "Scrape Restaurants from Yelp.com"
  task :yelp => :environment do 
    # Restaurant.all.each do |restaurant, index|
    for i in(0..990).step(10)
      url = "http://en.yelp.com.hk/search?find_desc=&find_loc=Hong+Kong&ns=1&start=" + i.to_s 
      puts url
      data = open(url, 'User-Agent' => "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)")
      parsed_data = Nokogiri::HTML(data)
    
      for i in (1..10)
        parse_restaurant(parsed_data, "li:nth-child(" + i.to_s + ") > div:nth-child(1).search-result.natural-search-result > div:nth-child(1).biz-listing-large > div:nth-child(1).main-attributes > div:nth-child(1).media-block.media-block--12 > div:nth-child(2).media-story > h3:nth-child(1).search-result-title > span:nth-child(1).indexed-biz-name > a:nth-child(1).biz-name", "li:nth-child(" + i.to_s + ") > div:nth-child(1).search-result.natural-search-result > div:nth-child(1).biz-listing-large > div:nth-child(2).secondary-attributes > span:nth-child(1).neighborhood-str-list", "li:nth-child(" + i.to_s + ") > div:nth-child(1).search-result.natural-search-result > div:nth-child(1).biz-listing-large > div:nth-child(1).main-attributes > div:nth-child(1).media-block.media-block--12 > div:nth-child(2).media-story > div:nth-child(4).price-category > span:nth-child(2).category-str-list > a:nth-child(1)", "li:nth-child(" + i.to_s + ") > div:nth-child(1).search-result.natural-search-result > div:nth-child(1).biz-listing-large > div:nth-child(1).main-attributes > div:nth-child(1).media-block.media-block--12 > div:nth-child(2).media-story > div:nth-child(4).price-category > span:nth-child(1).bullet-after > span:nth-child(1).business-attribute.price-range")
      end
    end
  end
end

def parse_restaurant(parsed_data, restaurant_name, restaurant_location, restaurant_cuisine, restaurant_price)
  
  name = parsed_data.css(restaurant_name)
  location = parsed_data.css(restaurant_location) 
  cuisine = parsed_data.css(restaurant_cuisine) 
  price = parsed_data.css(restaurant_price)

  # name.each_with_index do |item, index|
    new_restaurant = Restaurant.new

    data1 = name.text
    data2 = location.text
    data3 = cuisine.text
    data4 = price.text

    new_restaurant.name = data1
    new_restaurant.location = data2
    new_restaurant.cuisine = data3
    new_restaurant.price = data4

    if new_restaurant.save
      puts "#{new_restaurant.name} saved in db"
    else
      puts "#{new_restaurant.name} --------- FAILED!!!" 
    end
  # end
end


# namespace :scrape do

#   desc "Scrape Restaurants from Yelp.com"
#   task :yelp => :environment do 
#     # Restaurant.all.each do |restaurant, index|
#     for i in(0..990).step(10)
#       url = "http://en.yelp.com.hk/search?find_desc=&find_loc=Hong+Kong&ns=1&start=" + i.to_s 
#       puts url
#       data = open(url, 'User-Agent' => "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)")
#       parsed_data = Nokogiri::HTML(data)
    
#       # puts "starts scraping"

#       parse_restaurant(parsed_data, "div > div > h3 > span > a", "li > div > div > div > span.neighborhood-str-list", "div.media-block.media-block--12 > div.media-story > div.price-category > span.category-str-list > a:nth-child(1)", "div > div > div > span > span")

#     end
#   end
# end

# def parse_restaurant(parsed_data, restaurant_name, restaurant_location, restaurant_cuisine, restaurant_price)
  
#   name = parsed_data.css(restaurant_name)
#   location = parsed_data.css(restaurant_location) 
#   cuisine = parsed_data.css(restaurant_cuisine) 
#   price = parsed_data.css(restaurant_price)

#   name.each_with_index do |item, index|
#     new_restaurant = Restaurant.new

#     data1 = item.text
#     data2 = location[index].text
#     data3 = cuisine[index].text
#     data4 = price[index].text

#     new_restaurant.name = data1
#     new_restaurant.location = data2
#     new_restaurant.cuisine = data3
#     new_restaurant.price = data4

#     if new_restaurant.save
#       puts "#{new_restaurant.name} saved in db"
#     else
#       puts "#{new_restaurant.name} --------- FAILED!!!" 
#     end
#   end
# end








