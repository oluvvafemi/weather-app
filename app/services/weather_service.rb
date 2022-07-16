class WeatherService
  def initialize(location, unit)
    @location = location
    @unit = %w[metric imperial].include?(unit) ? unit : 'metric'
  end

  def values
    fetch_weather
    if @response_data['cod'] == 200
      success_data
    else
      failure_data
    end
  end

  private

  def fetch_weather
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{@location}&units=#{@unit}&appid=#{Rails.configuration.open_weather[:app_id]}")
    @response_data = JSON.parse(response.to_s)
  end

  def success_data
    {
      name: @response_data['name'],
      temperature: @response_data['main']['temp'],
      humidity: @response_data['main']['humidity'],
      pressure: @response_data['main']['pressure'],
      visibility: @response_data['visibility'],
      feels_like: @response_data['main']['feels_like']
    }
  end

  def failure_data
    {
      name: "couldn't find that",
      temperature: '',
      humidity: '',
      pressure: '',
      visibility: '',
      feels_like: ''
    }
  end
end
