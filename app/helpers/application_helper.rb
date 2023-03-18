module ApplicationHelper
    def number_to_indian_currency(number, html=false)
        txt = html ? content_tag(:span, 'Rs.', :class => :WebRupee) : 'Rs.'
        "#{txt} #{number.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")}"
    end
end
