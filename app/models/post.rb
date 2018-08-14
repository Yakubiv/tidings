class Post < ApplicationRecord
  FULL_DATE = '%B %d, %Y'
  mount_uploader :thumbnail, ThumbnailUploader

  acts_as_taggable_on :tags

  enum category: { interesting: 1, culture: 2, news: 3, buity: 4, important: 5, art: 6, other: 7 }
  enum status: { draft: 1, published: 2 }

  belongs_to :next_post, foreign_key: :next_post_id, class_name: 'Post'
  belongs_to :back_post, foreign_key: :back_post_id, class_name: 'Post'

  validates :title, presence: true

  default_scope { order(created_at: :desc) }

  def to_s
    title
  end

  def self.to_select(post)
    query = post.persisted? ? { id: post.id } : {}
    Post.published.where.not(query).map { |p| [p.title, p.id] }
  end

  def to_param
    url_alies
  end

  def to_meta_tags
    { title: title,
      description: description,
      keywords: meta_tags.join(', ') }
  end

  def self.find(input)
    find_by(url_alies: input)
  end
end
