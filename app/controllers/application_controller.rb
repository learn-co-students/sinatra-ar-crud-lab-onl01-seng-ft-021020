require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
    get '/' do
    redirect to '/articles'
  end
  
  get '/articles/new' do
  erb :new
  end
  
  post '/articles' do
  @article = Article.create(params)
  # binding.pry
  redirect to "/articles/#{@article.id}"
  end
  
  


get '/articles' do
@articles = Article.all
erb :index
end

  get '/articles/:id' do
    # binding.pry
    @article = Article.find(params["id"])
  erb :show
  end


  patch '/articles/:id' do
     binding.pry
    new_params = {}
    old_article = Article.find(params["id"])
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_article.update(new_params)
    redirect "/articles/#{params["id"]}"
   
  end

    delete '/articles/:id' do
    @article = Article.find(params["id"])
    @article.destroy
   redirect '/articles'
  end
  
  
  
  
  #get = gets
  #patch = update
  #post = 
  
  
end