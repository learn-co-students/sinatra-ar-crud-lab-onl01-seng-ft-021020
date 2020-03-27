
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
    # binding.pry
    @article = Article.new(params)
    @article.save
    redirect "/articles/#{Article.last.id}"
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
      @article = Article.find(params[:id])
      erb :edit
    end 

    patch '/articles/:id' do 
      # binding.pry
      edited_data={}
      edited_data[:title] = params[:title]
      edited_data[:content] = params[:content]
      article = Article.find_by(id: params[:id])
      article.update(edited_data)
      redirect "/articles/#{article.id}"
    end 
   
    delete '/articles/:id' do 
      
      @article = Article.find_by(id: params[:id])
      @article.destroy

      
    end 


end
