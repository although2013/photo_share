class PhotosController < ApplicationController
  before_action :signed_in_user
  before_action :set_photo, only: [:show, :destroy]


  def index
    @photos = Photo.all.limit(100)
  end

  def new
    @photo = current_user.photos.new
  end


  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to @photo
    else
      flash.now[:danger] = '图片上传失败'
      render 'new'
    end
  end

  def show
    @randmember = $redis.srandmember("photo#{@photo.id}", 5)
    #@is_liked   = $redis.sismember("photo#{@photo.id}", current_user.name)
    @like_count = $redis.scard("photo#{@photo.id}")
  end

  def destroy
    if current_user == @photo.user
      if @photo.destroy
        redirect_to photos_url
      else
        redirect_to root_url
      end
    else
      head status: 400
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