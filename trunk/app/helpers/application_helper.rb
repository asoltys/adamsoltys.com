# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def php (filename)
     `php #{File.expand_path(RAILS_ROOT)}/#{filename}`
	end
end
