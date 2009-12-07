class PostsController < ApplicationController

  def index
    per_page = params[:per_page] || cookies[:per_page] || 10
    cookies[:per_page] = per_page

    if params[:search].blank?
      @posts = Post.recent.paginate :page => params[:page], :per_page => per_page
    else
      @posts = Post.recent.paginated_primitive_search(params[:search], :page => params[:page], :per_page => per_page)
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
end
