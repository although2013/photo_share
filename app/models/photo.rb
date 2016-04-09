class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  default_scope -> { order('created_at DESC') }
  validates :photo, presence: true

end
