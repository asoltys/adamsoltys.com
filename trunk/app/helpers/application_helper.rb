# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def php (filename)
     `php #{File.expand_path(RAILS_ROOT)}/#{filename}`
	end
	
	def xhtml_ready_browser?
    return request.env["HTTP_ACCEPT"].split(',').include?("application/xhtml+xml")
  end
end
