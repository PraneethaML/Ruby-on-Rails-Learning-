require "google_custom_search"

puts "enter a keyword"
keyword = gets
results = GoogleCustomSearch.search(keyword)