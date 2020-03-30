require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/articles/new' do
  erb :new
end
  
  get '/articles/:id' do
    # @article = params[:id]
     @post = CreateArticles.find(params["id"])
    erb :show
    # @article
  end
  
  get '/' do
    redirect '/articles'
  end

get '/articles' do
@articles = Article.all
erb :index
end



  delete '/articles/:id' do
    @post = CreateArticles.find(params["id"])
    @post.destroy
   redirect '/articles'
  end
  
end