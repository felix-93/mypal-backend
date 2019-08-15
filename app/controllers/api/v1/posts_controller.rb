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
        render json: { post: PostSerializer.new(post) }
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
    end

    def custom_index
        index = scroll_params[:index]
        if Post.all.length <= index+1
            render json: { errors: "No Post left" }, status: :created
        else
            @posts = Post.all.sort_by{|post| post.created_at}.reverse[index..(index+3)]
            render json: @posts
        end
    end

    def custom_index
        index = scroll_params[:index]
        if scroll_params[:filter] == "Trending"
            @posts = Post.all.filter{|post| ((Time.now-post.created_at) / 3600) < 24 }
            if @posts.length <= index
                render json: { errors: "No Post left" }, status: :created
            else
                @posts = @posts.sort{|a, b| b.likes.length == a.likes.length ? b.created_at <=> a.created_at : b.likes.length <=> a.likes.length}[index..(index+3)]
                render json: @posts
            end
        else
            if Post.all.length <= index
                render json: { errors: "No Post left" }, status: :created
            else
                @posts = Post.all.sort_by{|post| post.created_at}.reverse[index..(index+3)]
                render json: @posts
            end
        end
    end

    def myposts
        user = User.find(scroll_params[:user])
        index = scroll_params[:index]
        if scroll_params[:filter] == "Trending"
            @posts = user.posts.filter{|post| ((Time.now-post.created_at) / 3600) < 24 }
            if @posts.length <= index 
                render json: { errors: "No Post left" }, status: :created
            else
                @posts = @posts.sort{|a, b| b.likes.length == a.likes.length ? b.created_at <=> a.created_at : b.likes.length <=> a.likes.length}[index..(index+3)]
                render json: @posts
            end
        else
            if user.posts.length <= index 
                render json: { errors: "No Post left" }, status: :created
            else
                @posts = user.posts.sort_by{|post| post.created_at}.reverse[index..(index+3)]
                render json: @posts
            end
        end
    end


    private

    def post_params
        params.require(:post).permit(:user_id, :title, :content, :img)
    end

    def scroll_params
        params.permit(:index, :user, :filter)
    end
    
end