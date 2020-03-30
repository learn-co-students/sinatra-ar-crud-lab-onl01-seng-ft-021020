require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect '/articles'
  end

get '/articles'
@articles = Article.all
erb :index
end



  delete '/articles/:id' do
    @post = Post.find(params["id"])
    @post.destroy
   redirect '/articles'
  end
  
end