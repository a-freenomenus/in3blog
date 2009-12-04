class PostsController < ApplicationController

  def index
    per_page = params[:per_page] || cookies[:per_page] || 10
    cookies[:per_page] = per_page

    @posts = Post.paginate :page => params[:page], :per_page => per_page, :order => 'created_at DESC'
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
end
