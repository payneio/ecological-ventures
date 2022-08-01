module ApplicationHelper


    def required_label(label)
        return "${label} (required)"
    end

    def markdown(text)
        options = [:hard_wrap, :filter_html, :autolink]
        Markdown.new(text, *options).to_html.html_safe
    end

    def dt_s(date_time)
        current_user ?
            date_time.strftime("%Y %b %d %-l:%M:%S %p") :
            date_time.strftime("%Y %b %d %-l:%M:%S %p %Z")
    end

end
