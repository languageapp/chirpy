class MessagesController < ApplicationController
  before_filter :authenticate_user!
 
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user = current_user
    @message.save!
    PrivatePub.publish_to("/conversations/#{@conversation.id}/new", "alert('#{@message.body}');")
 
    @path = conversation_path(@conversation)
  end
 
  private
 
  def message_params
    params.require(:message).permit(:body)
  end
end
