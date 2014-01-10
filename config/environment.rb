# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Modelle::Application.initialize!

Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"
Date::DATE_FORMATS[:default] = "%d/%m/%Y"
