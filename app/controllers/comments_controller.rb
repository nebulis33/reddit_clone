class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def new
        @comment = Comment.new(post_id: params[:post_id])
    end
    
    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save!
            redirect_to post_url(@comment.post_id)
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to new_post_comment_url(@comment.post_id)
        end
    end
    
    def show
        @comment = Comment.find(params[:id])
        @new_comment = @comment.child_comments.new(post_id: @comment.post_id)
    end

    private
        def comment_params
            params.require(:comment).permit(:content, :post_id, :parent_comment_id)
        end
end