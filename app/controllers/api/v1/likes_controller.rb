class Api::V1::LikesController < ApplicationController
    # def index
    #     @likes = Like.all
    #     render json: {likes: @likes}
    # end

    def create
        @like = Like.create(like_params)
        render json: { like: LikeSerializer.new(@like) }, status: :created
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: { message: "Your like has been deleted." }
    end

    private
    def like_params
        params.require(:like).permit(:likeable_type, :likeable_id, :user_id)
    end
end
