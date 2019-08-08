class Api::V1::CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: {comments: @comments}
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.valid?
            render json: { comment: CommentSerializer.new(@comment) }, status: :created
        else
            render json: { error: 'failed to create comment,make sure that you type something more than 2 characters' }, status: :not_acceptable
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: { message: "The comment has been deleted." }
    end

    private
    def comment_params
        params.require(:comment).permit(:text, :user_id, :fact_id)
    end
end
