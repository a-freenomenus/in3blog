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

  def feed
    @posts = Post.recent
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to posts_path
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_path
  end

end
