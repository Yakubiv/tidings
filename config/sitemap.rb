SitemapGenerator::Sitemap.default_host = "http://www.intonacia.com"

SitemapGenerator::Sitemap.create do
  add root_path, priority: 0.7, changefreq: 'daily'

  Post.find_each do |post|
    add post_path(post.slug)
  end
end
