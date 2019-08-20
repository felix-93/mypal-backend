class Api::V1::ConversationsController < ApplicationController
    skip_before_action :authorize, only: [:index, :create]

    # def index
    #     conversations = Conversation.all
    #     render json: conversations
    # end

    def show
      user = User.find(params[:id])
      conversations = user.conversations
      render json: conversations
    end
    
    def create
      if params[:id]
        conversation = Conversation.find(params[:id])
      else
        conversation = Conversation.find{|conversation| conversation.users.ids.include?(params[:userOne][:id]) && conversation.users.ids.include?(params[:userTwo][:id])}
      end
      if conversation
          render json: conversation
        else
          conversation = Conversation.create
          Chatlog.create(user: User.find(params[:userOne][:id]), conversation: conversation)
          Chatlog.create(user: User.find(params[:userTwo][:id]), conversation: conversation)
          conversation.title = conversation.users.map(&:username).join(" & ")
          conversation.save
          render json: conversation
        end
    end
      
      private
      
      # def conversation_params
      #   params.require(:conversation).permit(:title, :userOne, :userTwo, :id)
      # end

end
