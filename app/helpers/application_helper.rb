# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def gain_or_loss(amount)
		if amount > 0
			s = "<span class='profit'>" + sprintf("%.2f", amount) + "</span>"
		elsif amount < 0
			s = "<span class='loss'>(" + sprintf("%.2f", amount.abs) + ")</span>"
		else
			s = sprintf("%.2f", amount)
		end
    raw s
	end
	
	def show_flash
		[:notice, :warning, :message].collect do |key|
		content_tag(:div, flash[key], :class => "flash flash_#{key}") unless flash[key].blank?
		end.join
	end

  def title(title)
    content_for(:title) { title }
  end
end
