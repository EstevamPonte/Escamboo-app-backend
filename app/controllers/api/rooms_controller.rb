class Api::RoomsController < ApplicationController
  before_action :authenticate_with_token!

  def index
    @rooms = Room.where("rooms.idUser1_id = ? OR rooms.idUser2_id = ?", current_user.id, current_user.id)
    render json: @rooms , status: 200
  end

  def create
    idUser2 = room_params[:destiny]
    room = Room.new(title: room_params[:title], idUser1_id: current_user.id, idUser2_id: idUser2)
    room.save
    render json: room, status: 200
  end

  private

  def room_params
    params.require(:room).permit(:title, :destiny)
  end
end
