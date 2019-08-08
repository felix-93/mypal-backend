class Api::V1::PostsController < ApplicationController

    def create
        post = Post.create post_params
        post.user = @current_user
        if post.valid?
            post.save
            render json: post, status: :created
        else
            render json: { errors: post.errors.full_messages }, status: :not_accepted
        end
    end

    def index
        render json: Post.all
    end

    def show
        post = Post.find(params[:id])
        render json: { post: FullPostSerializer.new(post) }
    end

    def destroy
        post = Post.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :title, :content, :img)
    end
    
end