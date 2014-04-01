name             'helloworld'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures helloworld'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "rightscale"
recipe "helloworld::default","Prints hello world output" 


recipe "helloworld::sayhello","Prints my first name and several of my favorite things as output."



recipe "helloworld::my_city","Information about my city"

# Required Input #
attribute "helloworld/city_name",
   :display_name => "City Name",
   :description => "The city where I currently live.",
   :required => "required",
   :recipes => ["helloworld::my_city"]

# Recommended Input #
attribute "helloworld/rain",
   :display_name => "Raining",
   :description => "Is it raining? Yes or No",
   :required => "recommended",
   :choice => ["yes", "no"],
   :default => "no",
   :recipes => ["helloworld::my_city"]                                       
  
# Optional Input #
attribute "helloworld/temperature",
   :display_name => "Temperature",
   :description => "Current temperature in the city",
   :required => "optional",
   :recipes => ["helloworld::my_city"]