class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @rooms = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = "Room created"
      redirect_to root_path
    else
      flash[:error] = "Room not created"
      render 'new'
    end
  end

  def room_params
    params.require(:room).permit(:name)
  end

  def show
    @room = Room.find(params[:id])
    redirect_to room_message_path(@room)
  end
end
