class PostsController < ApplicationController
  before_filter :login_required, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :check_rights_for_modify, :only => [:edit, :update, :destroy]

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
    @post = Post.new(params[:post].merge(:user_id => current_user.id))
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to posts_path
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_path
  end

  def comment
    params[:comment].merge!(:user_id => current_user.id) if logged_in?
    @post = Post.find(params[:id])
    @comment = @post.comments.new(params[:comment])
  end

  def upload_audio
    @audio = Audio.new(params[:audio])

    responds_to_parent do
      render :update do |page|
        if @audio.save
          page.insert_html :bottom, 'audios', :partial => '/posts/partials/audio', :object => @audio
          page.insert_html :bottom, 'audios_fields', :partial => '/posts/partials/audio_fields', :locals => { :audio => @audio }
        end
        page.replace_html 'audio_form', :partial => '/posts/partials/forms/audio'
      end
    end
  end

  private

  def check_rights_for_modify
    @post = Post.find(params[:id])
    unauthorized! if cannot? :modify, @post
  end

end
