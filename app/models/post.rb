class Post < ApplicationRecord
  FULL_DATE = '%B %d, %Y'
  mount_uploader :thumbnail, ThumbnailUploader

  acts_as_taggable_on :tags

  enum category: { interesting: 1, culture: 2, news: 3, buity: 4, important: 5, art: 6, other: 7 }
  enum status: { draft: 1, published: 2 }

  validates :title, presence: true

  default_scope { order(created_at: :asc) }

  def to_param
    url_alies
  end

  def to_meta_tags
    { title: title,
      description: description,
      keywords: meta_tags.join(', ') }
  end

  def self.find(input)
    if input.is_a?(Integer)
      super
    else
      find_by_url_alies(input)
    end
  end
end
