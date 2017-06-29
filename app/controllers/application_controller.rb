require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @new_post = Post.create(params[:post])
    redirect '/posts'
  end

  get '/posts' do
    @all_posts = Post.all
    erb :posts
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    @post.update(params[:post])
    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id].to_i)
    @post_name = @post.name
    Post.delete(params[:id].to_i)
    erb :delete
  end

end
