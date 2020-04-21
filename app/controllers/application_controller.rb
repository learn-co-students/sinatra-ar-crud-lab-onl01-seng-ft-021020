
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
  
  post '/articles' do 
    Article.create(name: params[:name])
    erb :new  
  end
  
  get '/articles' do 
    @articles = Article.all  
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show 
  end
  
  get '/articles/:id/edit' do 
    
    erb :edit 
  end
  
  patch '/articles/:id' do 
    
    erb :edit 
  end
  
  delete '/articles/:id' do 
    
    erb :show 
  end
  
  post '/articles/:id/delete' do 
    
    erb :show 
  end
  
end
