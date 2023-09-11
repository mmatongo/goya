# lib/goya/controller.rb

require 'cgi'

class Controller
  def initialize(request = nil)
    @request = request
  end

  def render(action_name, locals = {})
    controller_name = self.class.name.gsub("Controller", "").downcase
    View.render(controller_name, action_name, locals)
  end

  def params
    if @request.request_method == 'POST'
      CGI::parse(@request.body)
    else
      @request.query
    end
  end
end
