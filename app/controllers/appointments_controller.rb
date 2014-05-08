class AppointmentsController < ApplicationController
  def create
   @appointment = current_user.appointments.create(appointment_params)
   # session[:return_to] ||= request.referer

   if Appointment.exists?(apt_date: @appointment.apt_date, created_at:@appointment.created_at)
    # @appointment.destroy
    # flash[:success] = "This date is already taken!"
    # taken_datetime(@appointment)
    redirect_to calendars_path
   else
     if @appointment.save
        flash[:success] = "Appointment scheduled!"
        # redirect_to session.delete(:return_to)
        redirect_to calendars_path
     else
        flash[:warning] = "Appointment not scheduled!"
        render "new"
     end
   end
  end

  def update
    # @appointment = Appointment.find(params[:id])
    # @patient = User.find_by(id:@appointment.user_id)
    # @doctor = User.find_by(id:@appointment.user_id)
    # session[:return_to] ||= request.referer
    # if @appointment.update(appointment_params)
    #   flash[:success] = "Appointment rescheduled!"
    #   redirect_to session.delete(:return_to)
    # else
    #   render 'edit'
    # end
  end

  def edit
    @appointment = Appointment.find_by(id:params[:id])
    @patient = User.find_by(id:@appointment.user_id)
    @doctor = User.find_by(id:@appointment.attending_physician)

    @appointment.update(apt_date:params[:apt_date], apt_time:params[:apt_time], attending_physician:params[:attending_physician], user_id:params[:user_id])

    # session[:return_to] ||= request.referer
    # if @appointment.update(appointment_params)
    #   flash[:success] = "Appointment rescheduled!"
    #   redirect_to session.delete(:return_to)
    # else
    #   render 'edit'
    # end
  end

  def reschedule
    @appointment = Appointment.find_by(params[:id])
    if @appointment.destroy
        flash[:success] = "Appointment cancelled!"
        redirect_to 
        # redirect_to calendars_path
     else
        flash[:warning] = "Appointment not cancelled! Try again."
        # render "new"
        redirect_to session.delete(:return_to)
     end
  end

  def destroy
    @appointment = Appointment.find_by(id:params[:id])
    session[:return_to] ||= request.referer
    if @appointment.destroy
        flash[:success] = "Appointment cancelled!"
        redirect_to session.delete(:return_to)
        # redirect_to calendars_path
     else
        flash[:warning] = "Appointment not cancelled! Try again."
        # render "new"
        redirect_to session.delete(:return_to)
     end
  end

  private

    def appointment_params
      params.require(:chart).permit(:user_id, :apt_date, :apt_time, :attending_physician, :rescheduled)
    end
end
