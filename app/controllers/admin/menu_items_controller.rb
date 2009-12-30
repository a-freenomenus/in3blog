class Admin::MenuItemsController < Admin::AdminController
  def index
    @menu_items = MenuItem.all
  end
  
  def new
    @menu_item = MenuItem.new
  end
  
  def create
    @menu_item = MenuItem.new(params[:menu_item])
    if @menu_item.save
      flash[:notice] = "Successfully created menu item."
      redirect_to admin_menu_items_path
    else
      render :new
    end
  end
  
  def edit
    @menu_item = MenuItem.find(params[:id])
  end
  
  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update_attributes(params[:menu_item])
      flash[:notice] = "Successfully updated menu item."
      redirect_to admin_menu_items_path
    else
      render :edit
    end
  end
  
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    flash[:notice] = "Successfully destroyed menu item."
    redirect_to admin_menu_items_url
  end

  def sort
    params[:items].each_with_index do |id, index|
      MenuItem.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
