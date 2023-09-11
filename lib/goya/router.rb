# lib/goya/router.rb

class Router
  @routes = {}

  class << self
    attr_reader :routes

    def route(http_verb, path, controller_action)
      @routes[http_verb] ||= {}
      @routes[http_verb][path] = controller_action
    end

    def resolve(http_verb, path)
      if static_file?(path)
        # Serve static file
        return "StaticFileHandler"
      else
        @routes[http_verb][path]
      end
    end

    def static_file?(path)
      # Logic to check if the path is for a static file
      path.match(/\.(jpg|jpeg|png|css|js)$/)
    end

    def resources(resource_name)
      # Define RESTful routes for the resource
      route("GET", "/#{resource_name}", "#{resource_name}#index")
      route("GET", "/#{resource_name}/:id", "#{resource_name}#show")
      route("GET", "/#{resource_name}/new", "#{resource_name}#new")
      route("POST", "/#{resource_name}", "#{resource_name}#create")
      route("GET", "/#{resource_name}/:id/edit", "#{resource_name}#edit")
      route("PUT", "/#{resource_name}/:id", "#{resource_name}#update")
      route("DELETE", "/#{resource_name}/:id", "#{resource_name}#destroy")
    end
  end
end
