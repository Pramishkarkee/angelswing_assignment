class Api::V1::ContentController < ApplicationController
  before_action :authentication, only: [:create, :update, :destroy]
  def index
    contents = Content.all
    render json: contents, status:200
  end

  def show
    content = Content.find_by(id: params[:id])
    if content
      render json:content, status:200
    else
      render json: {error: "Not Found"}
    end
  end

  def create
    content = Content.new(
      title: create_content_params[:title],
      body: create_content_params[:body],
      summary: create_content_params[:status],
      published_at: Time.now,
      meta_description: create_content_params[:meta_description],
      meta_keywords: create_content_params[:meta_keywords],
      slug: create_content_params[:slug],
      author: @current_user,
      category: create_content_params[:category]
    )
    if content.save
      render json: {message:"Content Created Successfully !!"}
    else
      render json: {message:"Error"}
    end
    
  end

  def update
    content = Content.find_by(id:params[:id])
    if authorized_user?(content.author.id)
      if content.update(create_content_params)
        render json: content
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {message:"You are not authorized to update this content."},status: :unauthorized
    end
  end

  def destroy
    content = Content.find_by(id:params[:id])
    if authorized_user?(content.author.id)
      content.destroy
      head :no_content
    else
      render json: { error: "You are not authorized to delete this content." }, status: :unauthorized
    end
  end

  private
  def create_content_params
    params.require(:content).permit(:title, :body, :summary, :status, :meta_description, :meta_keywords, :slug, :category)
  end

  def authorized_user?(user_id)
    @current_user.id == user_id.to_i
  end

end
