class CalendarsController < ApplicationController
  before_action :authenticate_user! #protects page with auth
  # before_action :correct_user

  def index
    @appointments = current_user.appointment_feed
  end

  def create
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def correct_user
    # @user = User.find(params[:id])

    # ROLES:
    # -1  = inactive
    # 1   = patient
    # 30  = receptionist
    # 50  = nurse
    # 60  = pa
    # 66  = doctor
    # 90  = lab
    # 100 = admin

    redirect_to(root_url) unless current_user.role == 0 || 30
  end
end
