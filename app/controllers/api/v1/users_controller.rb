class Api::V1::UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        user = User.create( user_params )
        if user.valid?
            render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id)}, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :accepted
        end
    end

    def show
        user = User.find(params[:id])
        render json: { user: UserSerializer.new(user) }
    end

    def index
        render json: User.all
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :biography)
    end
end
