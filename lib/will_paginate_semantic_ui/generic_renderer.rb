module WillPaginateSemanticUi
  module GenericRenderer
    GAP = "&hellip;"

    def to_html
      list_items = pagination.map do |item|
        item.class == Integer ? page_number(item) : send(item)
      end.join(@options[:link_separator])

      tag("div", list_items, class: ul_class)
    end

    protected

    def page_number(page)
      classLink = "item"
      classLink += " active" if page == current_page
      link(page, page, {class: classLink})
    end

    def previous_or_next_page(page, classname)
      classLink = "icon item"
      unless page
        tag(:a, tag("i", "", class: "#{classname} chevron icon"), class: classLink + " disabled")
      else
        link(tag("i", "", class: "#{classname} chevron icon"), page, {class: classLink})
      end
    end

    def gap
      tag("div", GAP, class: "disabled item")
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, "left")
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, "right")
    end

    def ul_class
      ["pagination ui menu", @options[:class]].compact.join(" ")
    end
  end
end
