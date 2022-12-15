class InvitationsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      Invitation.create(invited_by_id: current_user.id, invoted_id: user.id)
    else
      # Wysyłanie zaproszenia emailem
    end
    redirect_to friends_path
  end
end
