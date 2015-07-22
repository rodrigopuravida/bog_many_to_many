class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find params[:id]
  end

  def new
    @tag = Tag.new
  end

  def create
    # render json: params

    c = Tag.create(tag_params)
    redirect_to tags_path
  end

  def destroy
    Tag.find(params[:id]).delete
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
