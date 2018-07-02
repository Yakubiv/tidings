class Post < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader

  enum category: { interesting: 1, culture: 2, news: 3, buity: 4 }
  enum status: { draft: 1, published: 2 }

  validates :title, presence: true

  def to_param
    url_alies
  end

  def self.find(input)
    if input.is_a?(Integer)
      super
    else
      find_by_url_alies(input)
    end
  end
end
