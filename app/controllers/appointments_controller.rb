class AppointmentsController < ApplicationController
  def create
   @appointment = current_user.appointments.create(appointment_params)
   session[:return_to] ||= request.referer
   if @appointment.save
      flash[:success] = "Appointment scheduled!"
      redirect_to session.delete(:return_to)
   else
      flash[:warning] = "Appointment not scheduled!"
      render "new"
   end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def appointment_params
    params.require(:chart).permit(:user_id, :apt_date, :apt_time, :attending_physician, :rescheduled)
  end
end
