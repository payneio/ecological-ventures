module ApplicationHelper


    def required_label(label)
        return "${label} (required)"
    end

    def markdown(text)
        options = [:hard_wrap, :filter_html, :autolink]
        Markdown.new(text, *options).to_html.html_safe
    end

end
