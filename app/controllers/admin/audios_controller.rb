class Admin::AudiosController < Admin::AdminController

  def index
    @audios = Audio.all
  end

  def create
    @audio = Audio.new(params[:audio])
    if @audio.save
      flash[:notice] = 'Mp3 uploaded succesfully'
      redirect_to admin_audios_path
    else
      @audios = Audio.all
      render :index
    end
  end

  def destroy
    @audio = Audio.find(params[:id])
    flash[:notice] = "#{@audio.mp3_file_name} deleted succesfully"
    @audio.destroy
    redirect_to admin_audios_path
  end

end
