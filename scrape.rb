require 'json'
require 'open-uri'
require 'nokogiri'

def get_photos(url)
  puts "Going to get photos from" + url

  # Get the domain
  host = URI.parse(url).host.downcase
  domain = host.start_with?('www.') ? host[4..-1] : host

  # Get the page
  site = Nokogiri::HTML(open(url))

  if domain == "chicagotribune.com" || domain == "latimes.com"
    # Trib holds their article photos in <article> --> <img> with an attribute 'data-baseurl'
    images = site.css('article img')

    # Pull out that url
    urls = []
    images.each do |image|
      # skip videos
      next if image['data-baseurl'].include? "video"
      # push images
      urls.push(image['data-baseurl'])
    end
    # return all images
    urls
  else
    false
  end
end

# get_photos("http://www.chicagotribune.com/news/ct-bison-return-illinois-met-20141006-story.html#page=1")