# lib/goya/model.rb
class Model
  def self.table_name
    name.downcase + 's'
  end

  def self.new
    Database.connection.execute("SELECT * FROM #{table_name} LIMIT 1")
  end

  def self.all
    Database.connection.execute("SELECT * FROM #{table_name}")
  end

  def self.find(id)
    Database.connection.execute("SELECT * FROM #{table_name} WHERE id = ?", id).first
  end

  def self.create(attributes)
    keys = attributes.keys.join(',')
    values = attributes.values
    placeholders = Array.new(values.size, '?').join(',')
    Database.connection.execute("INSERT INTO #{table_name} (#{keys}) VALUES (#{placeholders})", *values)
  end

  def self.update(id, attributes)
    keys = attributes.keys.join('=?,') + '=?'
    values = attributes.values
    Database.connection.execute("UPDATE #{table_name} SET #{keys} WHERE id = ?", *values, id)
  end

  def self.delete(id)
    Database.connection.execute("DELETE FROM #{table_name} WHERE id = ?", id)
  end

  def self.where(conditions)
    keys = conditions.keys.join('=? AND ') + '=?'
    values = conditions.values
    Database.connection.execute("SELECT * FROM #{table_name} WHERE #{keys}", *values)
  end

  def self.first
    Database.connection.execute("SELECT * FROM #{table_name} LIMIT 1").first
  end

  def self.last
    Database.connection.execute("SELECT * FROM #{table_name} ORDER BY id DESC LIMIT 1").first
  end

  def self.count
    Database.connection.execute("SELECT COUNT(*) FROM #{table_name}").first['COUNT(*)']
  end
end
