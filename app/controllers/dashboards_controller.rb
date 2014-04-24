class DashboardsController < ApplicationController
   before_action :authenticate_user! #protects page with auth
   before_action :correct_user

   def overview
      @msg = current_user.messages.build
      @messages = current_user.feed
   end

   def messages
      @msg = current_user.messages.build
      @messages = current_user.feed
   end

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

      redirect_to(root_url) unless current_user.role == 0
   end
end
