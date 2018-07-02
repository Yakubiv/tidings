class Post < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader

  validates :title, presence: true

  def to_params
    url_alies
  end
end
