require 'mathn'
require 'httparty'

#def Botdistance
  # radians = degrees * Math::PI / 180
  #attr_accessor  :ville_depart :ville_arrivee
def botdistance(long1, long2, lat1, lat2, unit)
  @theta = long1 - long2;
  @dist = Math.sin(lat1 * Math::PI / 180 ) * Math.sin(lat2 * Math::PI / 180 ) +  Math.cos(lat1 * Math::PI / 180) * Math.cos(lat1 * Math::PI / 180) * Math.cos(@theta * Math::PI / 180);
  @dist = Math.acos(@dist)
  @dist = @dist * Math::PI / 180
  @miles = @dist * 60 * 1.1515;
  @unit = unit.upcase

  if (unit == "K")
    return (@miles * 1.609344)
  elsif (unit == "N")
    return (@miles * 0.8684)
  else
    return @miles
  end

end


puts "Adresse de départ (s'il vous plaît): "
adresse_depart = gets.chomp


response = JSON.parse(HTTParty.get("http://nominatim.openstreetmap.org/search?q=#{adresse_depart}&format=json&polygon=1").body)
lat1 = response[0]["lat"].to_f
lon1 = response[0]["lon"].to_f

puts "Adresse de d'arrivé (s'il vous plaît): "
adresse_arrivee = gets.chomp

response = JSON.parse(HTTParty.get("http://nominatim.openstreetmap.org/search?q=#{adresse_arrivee}&format=json&polygon=1").body)
lat2 = response[0]["lat"].to_f
lon2 = response[0]["lon"].to_f

puts botdistance(lon1, lon2, lat1, lat2, 'K')

  #puts botdistance(32.9697, -96.80322, 29.46786, -98.53506, "M") # " Miles\n"
  #puts botdistance(32.9697, -96.80322, 29.46786, -98.53506, "K") # " Kilometers\n"
  #puts botdistance(32.9697, -96.80322, 29.46786, -98.53506, "N") # " Nautical Miles\n"


