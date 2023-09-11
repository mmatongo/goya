# lib/goya/database.rb
require 'sqlite3'

class Database
  def self.connection
    @connection ||= SQLite3::Database.new("db/development.sqlite3")
  end
end
