module MessagesHelper
    def status_color(status)
        case status
            when "incoming"
            "grey"
            when "draft"
            "orange"
            when "reviewed"
            "green"
            when "spam"
            "red"
        end
    end
end
