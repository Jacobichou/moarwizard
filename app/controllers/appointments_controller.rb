class AppointmentsController < ApplicationController
  def create
   @appointment = current_user.appointments.create(appointment_params)
   session[:return_to] ||= request.referer

   if Appointment.exists?(apt_date: @appointment.apt_date)
    # @appointment.destroy
    flash[:success] = "This date is already taken!"
    # taken_datetime(@appointment)
    redirect_to calendars_path
   else
     if @appointment.save
        flash[:success] = "Appointment scheduled!"
        redirect_to session.delete(:return_to)
     else
        flash[:warning] = "Appointment not scheduled!"
        render "new"
     end
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
