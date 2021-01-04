class SubsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :moderator_edits_subs!, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.subs.build(sub_params)
    if @sub.save
      flash[:success] = "The sub has been created!"
      redirect_to sub_url(@sub)
    else
      flash.now[:error] = @sub.errors.full_messages
      render 'new'
    end
  end

  def show
    @sub = Sub.includes(:posts).find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      flash[:success] = "The sub has been updated!"
      redirect_to sub_url(@sub)
    else
      flash.now[:error] = @sub.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    if @sub.delete
      flash[:success] = "Successfully deleted the sub!"
      redirect_to subs_url
    else
      flash[:error] = @sub.errors.full_messages
      redirect_to sub_url(@sub)
    end
  end

  private

    def sub_params
      params.require(:sub).permit(:title, :description)
    end

    def moderator_edits_subs!
      return if current_user.subs.find_by(id: params[:id])
      render json: 'Forbidden', status: :forbidden
    end

end
