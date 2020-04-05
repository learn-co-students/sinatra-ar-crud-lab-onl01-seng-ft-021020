require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles/new' do
    @article = Article.new
   # binding.pry
    erb :new
  end

  post '/articles' do
    Article.create(params)
    erb :articles
  end

  get '/articles' do
    @article = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end

  patch '/articles/:id' do
    binding.pry
    id = params["id"]
    new_params = {}
    old_article = Article.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_post.update(new_params)

    redirect "/articles/#{id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params["id"])
    @article.destroy
    erb :delete
  end
end
# class ApplicationController < Sinatra::Base

#   configure do
#     set :public_folder, 'public'
#     set :views, 'app/views'
#   end
  
#     get '/' do
#     redirect to '/articles'
#   end
  
#   get '/articles/' do
# @articles = Article.all
# erb :index
# end

#   get '/articles/new' do
    
#   @article = Article.new
#   # binding.pry
#   erb :new
#   end
  
#   post '/articles' do
#     # binding.pry
#   @article = Article.create(params)
  
#   redirect to "/articles/#{@article.id}"
#   end


#   get '/articles/:id' do
#     # binding.pry
#     @article = Article.find(params["id"])
#   erb :show
#   end
# get "/articles/:id/edit" do
#   @article = Article.find(params["id"])
#     erb :edit
#   end

#   patch '/articles/:id' do
#     binding.pry
#     new_params = {}
#     old_article = Article.find(params["id"])
#     new_params[:title] = params["title"]
#     new_params[:content] = params["content"]
#     old_article.update(new_params)
#     redirect "/articles/#{params["id"]}"
   
#   end

#     delete '/articles/:id' do
#     @article = Article.find(params["id"])
#     @article.destroy
#   redirect '/articles'
#   end
  
  
  
  
#   #get = gets
#   #patch = update
#   #post = 
  
  
# end