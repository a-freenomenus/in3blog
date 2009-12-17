class Admin::AudiosController < Admin::AdminController

  def index
    @audios = Audio.all
  end

  def destroy
    @audio = Audio.find(params[:id])
    flash[:notice] = "#{@audio.mp3_file_name} deleted succesfully"
    @audio.destroy
    redirect_to admin_audios_path
  end

end
