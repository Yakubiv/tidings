SitemapGenerator::Sitemap.default_host = "http://www.intonacia.com"

SitemapGenerator::Sitemap.create do
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  add root_path, priority: 0.7, changefreq: 'daily'
  add posts_path, priority: 0.7, changefreq: 'daily'

  Post.find_each do |post|
    add post_path(post.url_alies), lastmod: post.updated_at
  end
end
