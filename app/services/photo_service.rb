class PhotoService
  def initialize(city)
    @city_name = city
  end

  def photo_url
    response = fetch_photo
    "#{JSON.parse(response.to_s)['results'][0]['urls']['raw']}&q=70&w=1920&h=1080" if response.code == 200
  end

  private

  def fetch_photo
    HTTP.get("https://api.unsplash.com/search/photos?client_id=#{Rails.configuration.unsplash[:access_key]}&query=#{@city_name}&orientation=landscape")
  end
end
