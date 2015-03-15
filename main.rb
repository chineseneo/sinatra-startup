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
    @page_name = 'index'
    @page_title = '陕西奕诚生物科技有限公司 - 首页'
    @page_description = '欢迎来到陕西奕诚生物科技有限公司，本公司位于陕西省商洛市镇安县。公司致力于将生物科技融入农业发展，引进国外先进作物，结合食品深加工技术，生产高品质农作物和精致食品。科技融入栗乡，奕诚必出精品。'
    erb :index, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end

  get '/information' do
    @page_name = 'information'
    @page_title = '陕西奕诚生物科技有限公司 - 公司概况'
    @page_description = '陕西奕诚生物科技有限公司与陕西恒富源林业有限公司、陕西秦山核桃专业合作社并肩合作。生产工厂位于秦岭山区镇安县云镇，优质的空气质量加上绿色有机的原材料，用科学的生产工艺生产出来的产品不仅口感香醇更利于健康。'
    erb :information, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end

  get '/projects' do
    project_id = params[:project_id] || 1
    @page_name = 'projects'
    @page_title = '陕西奕诚生物科技有限公司 - 公司项目情况'
    @page_description = '陕西奕诚生物科技有限公司目前正在致力于药用植物及经济作物新型苗孵化基地及推广种植，镇安秦岭山区5000亩树莓基地建设，商洛市镇安县1000亩七叶树基地建设和镇安县板栗种植及深加工产业化等四大项目。'
    erb "projects-#{project_id}".to_sym, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end

  get '/products' do
    @page_title = '产品展示'
    @page_name = 'products'
    erb :products, :layout => :default,
        :layout_options => {:views => settings.layouts_dir}
  end
end