# lib/goya/cache.rb
class Cache
  @store = {}

  def self.read(key)
    @store[key]
  end

  def self.write(key, value)
    @store[key] = value
  end
end
