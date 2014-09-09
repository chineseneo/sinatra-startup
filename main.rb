require 'sinatra'
require 'sinatra/reloader'

# require 'mongoid'
# require 'slim'
require 'compass'
require 'erb'
#require 'redcarpet'
 
 #** Set up Sinatra variables
set :app_file,      __FILE__
set :root,          File.dirname(__FILE__)
set :views,         File.join(File.dirname(__FILE__), 'views')
set :public_dir,    File.join(File.dirname(__FILE__), 'public')
set :layouts_dir,   File.join(File.dirname(__FILE__), 'views', 'layouts')
set :partials_dir,  File.join(File.dirname(__FILE__), 'views', 'partials')

configure do
  disable :show_exceptions
  disable :raise_errors

  # Mongoid.load!("./mongoid.yml")
  # Set your Google Analytics ID here if you have one:
  # set :google_analytics_id, 'UA-12345678-1'

    #** Configure compass
    #* @see http://compass-style.org/help/tutorials/integration/
    #**
    Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
end

helpers do
### CLEANUP!
###
### https://github.com/daz4126/sinatra-head-cleaner/tree/master/sinatra
###
  require  './helpers/error.rb'
end


not_found do
  show_404
end

error do
  show_500
end

get '/' do
    @page_title = 'Hello World!'
f
    erb :index, :layout => :default,
                :layout_options => {:views => settings.layouts_dir}
end