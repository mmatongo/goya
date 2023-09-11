# lib/goya/view.rb

require 'erb'

class View
  def self.render(controller_name, action_name, locals = {})
    # Construct the full path to the view file
    template_path = File.join('app', 'views', controller_name, "#{action_name}.erb")

    # Check if the template exists
    unless File.exist?(template_path)
      raise "Template not found: #{template_path}"
    end

    # Read the template content
    template_content = File.read(template_path)

    # Render the template with the provided locals
    ERB.new(template_content).result_with_hash(locals)
  end
end
