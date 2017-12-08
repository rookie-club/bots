require 'mathn'

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
  #end

    if (unit == "K")
      return (@miles * 1.609344)
    elsif (unit == "N")
      return (@miles * 0.8684)
    else
      return @miles
    end
  end

  puts botdistance(32.9697, -96.80322, 29.46786, -98.53506, "M") # " Miles\n"
  puts botdistance(32.9697, -96.80322, 29.46786, -98.53506, "K") # " Kilometers\n"
  puts botdistance(32.9697, -96.80322, 29.46786, -98.53506, "N") # " Nautical Miles\n"
