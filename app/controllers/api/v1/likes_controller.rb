class Api::V1::LikesController < ApplicationController

    def create
        @like = Like.create(like_params)
        render json: { like: LikeSerializer.new(@like) }, status: :created
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: { like: LikeSerializer.new(@like) }, status: :created
    end

    private
    def like_params
        params.require(:like).permit(:likeable_type, :likeable_id, :user_id)
    end
end