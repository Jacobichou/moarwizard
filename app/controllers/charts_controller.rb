class ChartsController < ApplicationController

  def index
    @charts = current_user.chart_feed
  end

  def create
   @chart = current_user.charts.build(chart_params)
   session[:return_to] ||= request.referer
   if @chart.save
      flash[:success] = "Chart generated!"
      redirect_to session.delete(:return_to)
   else
      flash[:warning] = "Chart not generated!"
      redirect_to messages_path
   end
  end

  def destroy
  end

  def show
     
  end

  private

  def chart_params
      params.require(:chart).permit(:user_id, :bp, :heart_rate, :resp_rate, :temp, :given_symptoms, :observed_symptoms, :comments, :diagnosis,
                                    :prognosis, :visit_purpose, :preconditions, :height, :weight, :verbal_instructions, :notes ,:lab_request,
                                    :attachment_type)
    end
end