class ChartsController < ApplicationController
  before_action :authenticate_user! #protects page with auth
  # before_action :correct_user

  def index
    @charts = current_user.chart_feed
  end

  def create
   # @chart = Chart.create(chart_params)
   @chart = Chart.create(params[:user_id,:bp, :heart_rate, :resp_rate, :temp, :given_symptoms, :observed_symptoms, :comments, :diagnosis,
                                  :prognosis, :visit_purpose, :preconditions, :height, :weight, :verbal_instructions, :notes ,:lab_request,
                                  :attachment_type])
   session[:return_to] ||= request.referer
   if @chart.save
      flash[:success] = "Chart generated!"
      redirect_to session.delete(:return_to)
   else
      flash[:warning] = "Chart not generated!"
      render "new"
   end
  end

  def check_in
    @chart = Chart.create(user_id:params[:user_id])
    @patient = User.find_by(id:params[:user_id])
    if @chart.save
      flash[:success] = "#{@patient.full_name} checked in!"
      redirect_to dashboard_path
    else
      flash[:warning] = "Something went wrong with checking in the patient. Please, try again. :)"
    end

    # redirect_to dashboard_path, :flash => { :success => "#{@patient.full_name} checked in!" }
  end

  def destroy
  end

  def show
    @chart = Chart.find(params[:id])
  end

  def edit
    @chart = Chart.find(params[:id])
  end

  def update
    @chart = Chart.find(params[:id])
    session[:return_to] ||= request.referer
    if @chart.update(chart_params)
      # redirect_to @chart
      # redirect_to charts_path
      flash[:success] = "Chart updated!"
      redirect_to session.delete(:return_to)
    else
      render 'edit'
    end
  end

private

  def chart_params
    params.require(:chart).permit(:user_id, :bp, :heart_rate, :resp_rate, :temp, :given_symptoms, :observed_symptoms, :comments, :diagnosis,
                                  :prognosis, :visit_purpose, :preconditions, :height, :weight, :verbal_instructions, :notes ,:lab_request,
                                  :attachment_type)
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

    redirect_to(root_url) unless current_user.role == 0 || 30
  end

end