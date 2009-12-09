class Admin::InvitationsController < Admin::AdminController
  def new
    @invitation = Invitation.new
  end

  def index
    @invitations = Invitation.all
  end

  def create
    @invitation = Invitation.new(params[:invitation])

    if @invitation.save
      Mailer.deliver_invitation(@invitation, register_url(@invitation.token))
      flash[:notice] = "Invitation sent."
      redirect_to admin_invitations_path
    else
      render :new
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to admin_invitations_path
  end

end
