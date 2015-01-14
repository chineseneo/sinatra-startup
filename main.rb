# -*- coding: utf-8 -*-
require 'sinatra'
require 'sinatra/reloader'

# require 'mongoid'
# require 'slim'
require 'compass'
require 'erb'
#require 'redcarpet'

class Main < Sinatra::Application

  configure do
    disable :show_exceptions
    disable :raise_errors

    #** Set up Sinatra variables
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, File.join(File.dirname(__FILE__), 'views')
    set :public_dir, File.join(File.dirname(__FILE__), 'public')
    set :layouts_dir, File.join(File.dirname(__FILE__), 'views', 'layouts')
    set :partials_dir, File.join(File.dirname(__FILE__), 'views', 'partials')

    # Mongoid.load!("./mongoid.yml")
    # Set your Google Analytics ID here if you have one:
    # set :google_analytics_id, 'UA-12345678-1'

    #** Configure compass
    #* @see http://compass-style.org/help/tutorials/integration/
    #**
    Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
  end

  not_found do
    status 404
    @page_title = '404'
    erb :'404', :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end

  error do
    status 500
    @page_title = '500'
    erb :'500', :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end

  get '/' do
    @page_title = '首页'
    @page_name = 'index'
    erb :index, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end
  get '/information' do
    @page_title = '公司概况'
    @page_name = 'information'
    erb :information, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end
  get '/projects' do
    @page_title = '项目情况'
    @page_name = 'projects'
    erb :projects, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end
  get '/products' do
    @page_title = '产品展示'
    @page_name = 'products'
    erb :products, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end
end