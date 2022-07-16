class MainController < ApplicationController
  def index
    @data = WeatherService.new(location_params, params[:unit]).values
  end

  private

  def location_params
    if params[:location].nil? || params[:location].empty? || params[:location].length < 2
      default_location
    else
      params[:location]
    end
  end

  def default_location
    ipinfo ||= request.env['ipinfo'].all
    @default_location ||= ipinfo.key?(:city) ? ipinfo.city : 'Antarctica'
  end
end
