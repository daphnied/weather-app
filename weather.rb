require 'rubygems'
require 'barometer'

def get_locations_weather(greensboro)
  Barometer.new(greensboro).measure
end

weather = get_locations_weather('Greensboro')
tomorrow = Time.now.strftime('%d').to_i + 1


weather.forecast.each do |forecast|
  day = forecast.starts_at.day

   if day == tomorrow
     dayName = 'Tomorrow'
   else
     dayName = forecast.starts_at.strftime('%A')
   end

   puts dayName + ' is going to be' + forecast.icon + ' with a low of' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
 end
