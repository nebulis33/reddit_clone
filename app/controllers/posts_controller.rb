class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :author_edits_posts!, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    #will need to get sub ids in controller possibly
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "The post has been created!"
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "The post has been updated!"
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.delete
      flash[:success] = "Successfully deleted the post!"
      redirect_to posts_url
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to post_url(@post)
    end
  end

  def upvote
    vote(1)
  end

  def downvote
    vote(-1)
  end

  private

    def post_params
      params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
    end

    def author_edits_posts!
      return if current_user.posts.find_by(id: params[:id])
      render json: 'Forbidden', status: :forbidden
    end

    def vote(num)
      post = Post.find(params[:id])
      vote = post.votes.find_or_initialize_by(user: current_user)

      unless vote.update(value: num)
        flash[:errors] = vote.errors.full_messages
      end
    end
end
