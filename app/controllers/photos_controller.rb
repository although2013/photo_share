class PhotosController < ApplicationController
  before_action :signed_in_user
  before_action :set_photo, only: [:show, :destroy]


  def new
    @photo = current_user.photos.new
  end


  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      flash[:success] = '图片上传成功'
      redirect_to @photo
    else
      flash.now[:danger] = '图片上传失败'
      render 'new'
    end
  end

  def show
  end

  def destroy
    if current_user == @photo.user_id
      if @photo.destroy
        redirect_to photos_url
      else
        redirect_to root_url
      end
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :photo, :user_id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
  
end