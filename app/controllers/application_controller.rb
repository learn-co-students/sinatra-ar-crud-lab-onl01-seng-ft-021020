
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do 
    erb :new 
  end
  
  post '/articles/show' do 
    Article.create()
    erb :show 
  end
  
  get '/articles/:id' do
    
    erb :show 
  end
  
  get '/articles/:id/edit' do 
    
  end
  
end
