class Admin::LinksController < Admin::AdminController
  def index
    @links = Link.all
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(params[:link])
    if @link.save
      flash[:notice] = "Successfully created link."
      redirect_to admin_link_path(@link)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "Successfully updated link."
      redirect_to admin_link_path(@link)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:notice] = "Successfully destroyed link."
    redirect_to admin_links_url
  end

  def sort
    params[:items].each_with_index do |id, index|
      Link.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

end
