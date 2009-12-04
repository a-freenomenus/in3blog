class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:name])
    @posts = Post.tagged_with(@tag).paginate :page => params[:page], :per_page => 20
  end
end
