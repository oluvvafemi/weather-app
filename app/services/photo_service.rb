class PhotoService
  def initialize(city)
    @city_name = city.delete(' ')
  end

  def photo_url
    response = JSON.parse(fetch_photo.to_s)
    "#{response['results'][0]['urls']['raw']}&q=50&w=1920&h=1080" unless response['results'].empty?
  end

  private

  def fetch_photo
    HTTP.get("https://api.unsplash.com/search/photos?client_id=#{Rails.configuration.unsplash[:access_key] || ENV['UNSPLASH_ACCESS_KEY']}&query=#{@city_name}&orientation=landscape")
  end
end
