class MessagesController < ApplicationController
  def create
   @message = current_user.messages.build(message_params)
   if @message.save
      flash[:success] = "Message sent!"
      redirect_to root_url
   else
      render 'dashboard/overview'
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
