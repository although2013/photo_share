class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  default_scope -> { order('created_at DESC') }
  validates :photo, presence: true

end
