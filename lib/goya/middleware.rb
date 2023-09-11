# lib/goya/middleware.rb
class Middleware
  def initialize(app)
    @app = app
  end

  def call(env)
    # Pre-processing
    response = @app.call(env)
    # Post-processing
    response
  end
end
