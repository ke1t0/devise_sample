class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(room_id: params[:message][:room_id], user_id: current_user.id).present?
      @message = Message.create(params_message)
      redirect_to room_path(@message.room.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def params_message
      params.require(:message).permit(:room_id, :user_id, :content).merge(user_id: current_user.id)
    end
end
