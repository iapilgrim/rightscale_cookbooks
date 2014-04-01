rightscale_marker

  city_name = node[:helloworld][:city_name]
  temperature = node[:helloworld][:temperature]
  rain = node[:helloworld][:rain]
  
  log "I live in #{city_name}. The current temperature is #{temperature} degrees. And if you're wondering if you need an umbrella, the answer is #{rain}."