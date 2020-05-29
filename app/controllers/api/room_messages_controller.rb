class Api::RoomMessagesController < ApplicationController
  before_action :authenticate_with_token!

  def show
    room = Room.find_by(id: params[:id])
    render json: room.room_messages, status: 200
  end

  def create
    find_room = Room.find_by(id: message_params[:room_id])
    message = RoomMessage.new(room: find_room, user: current_user, message: message_params[:message])
    if message.save
      render json: message, status: 200
    else
      render json: { errors: message.errors }, status: 422
    end
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :message)
  end
end
