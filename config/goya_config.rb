# config/goya_config.rb
module GoyaConfig
  def self.database_url
    ENV['DATABASE_URL'] || 'sqlite3://db/development.sqlite3'
  end
end
