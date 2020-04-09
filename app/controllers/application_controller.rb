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
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
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
    @old_article = Article.find(params[:id])
    
    @old_article.update(params[:article])
 
    redirect "/articles/#{@old_article.id}"
  end

  delete '/articles/:id' do
    # @article = Article.find(params["id"])
    Article.destroy(params[:id])
    redirect to '/articles'
  end
end
