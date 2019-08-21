class Api::V1::MessagesController < ApplicationController
    skip_before_action :authorize, only: [:create]
    

    def create
        message = Message.create(message_params)
        conversation = message.conversation
        ActionCable.server.broadcast('conversations_channel', ConversationSerializer.new(conversation))
    end
      
      private
      
    def message_params
        params.require(:message).permit(:text, :conversation_id, :user_id)
    end
end
