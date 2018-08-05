task generate_sitemap: :environment do
  Rake::Task["sitemap:refresh"].invoke
end
