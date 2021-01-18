class MessagesController < ApplicationController
  def new

  end

  def create
    @user = User.find(current_user.id)
    @message = Message.create(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel',  {name: @user, content: @message}
     
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id,lesson_id: params[:lesson_id])
  end
end




