class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(body: params[:body], user: current_user)
    @message.save!
    @path = conversation_path(@conversation).partition('?').first
  end
end