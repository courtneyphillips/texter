class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    @message.save
    redirect_to new_message_path
  end

  def index
  end

  def show
  end

  private

  def message_params
      params.require(:message).permit(:to, :from, :body)
  end


end
