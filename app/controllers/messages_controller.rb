class MessagesController < ApplicationController
  def create
   @message = current_user.messages.build(message_params)
   session[:return_to] ||= request.referer
   if @message.save
      flash[:success] = "Message sent!"
      redirect_to session.delete(:return_to)
   else
      flash[:warning] = "Message not sent!"
      redirect_to messages_path
   end
  end

  def destroy
  end

  def show
     
  end

  # def new
  #    @msg = Message.new
  # end

  private

  def message_params
      params.require(:message).permit(:subject, :content, :recipient_id)
    end
end
