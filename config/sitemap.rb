SitemapGenerator::Sitemap.default_host = "http://www.intonacia.com"

SitemapGenerator::Sitemap.create do
  add root_path, priority: 0.7, changefreq: 'daily'
  add posts_path, priority: 0.7, changefreq: 'daily'

  Post.find_each do |post|
    add post_path(post.url_alies)
  end
end
