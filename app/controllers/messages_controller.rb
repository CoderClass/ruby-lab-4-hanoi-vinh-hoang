class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @room = Room.find(params[:room_id])
  end

  def new
    @messages = Message.all
    @room = Room.find(params[:room_id])
  end

  def create
    @message = Message.new message_params
    if @message.save!
      redirect_to(:back)
    else

    end
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
