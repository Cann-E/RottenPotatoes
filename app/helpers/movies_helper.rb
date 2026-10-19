module MoviesHelper

  def sortheader(column, label)

    active = (column == @sort_column)

    classes = "sortable"
    nextdir = "asc"
    arrow = "↕"
    ariasort = "none"

    if(active)
      classes = "sortable sorted sorted-#{@sort_direction}"

      if(@sort_direction == "asc")
        nextdir = "desc"
        arrow = "▲"
        ariasort = "ascending"
      else
        arrow = "▼"
        ariasort = "descending"
      end
    end

    hint = "Sort by #{label.downcase} (#{nextdir == "asc" ? "ascending" : "descending"})"
    arrowspan = content_tag(:span, arrow, class: "sort-indicator", "aria-hidden": true)

    link = link_to(safe_join([label, " ", arrowspan]),
                   movies_path(sort: column, direction: nextdir),
                   id: "#{column}_header", title: hint)

    return content_tag(:th, link, class: classes, "aria-sort": ariasort, scope: "col")
  end


  def sortbutton(column, label)

    classes = "sort-chip"
    nextdir = "asc"
    arrow = "↕"

    if(column == @sort_column)
      classes = "sort-chip sorted sorted-#{@sort_direction}"

      if(@sort_direction == "asc")
        nextdir = "desc"
        arrow = "▲"
      else
        arrow = "▼"
      end
    end

    arrowspan = content_tag(:span, arrow, class: "sort-indicator", "aria-hidden": true)

    return link_to(safe_join([label, " ", arrowspan]),
                   movies_path(sort: column, direction: nextdir),
                   id: "#{column}_chip", class: classes)
  end


  def sortcellclass(column)

    if(column == @sort_column)
      return "sorted-cell sorted-cell-#{@sort_direction}"
    end

    return nil
  end


  def displayposter(movie, size)

    if(movie.poster_url.present?)
      return image_tag(movie.poster_url, alt: "#{movie.title} poster", class: "poster poster-#{size}", loading: "lazy")
    end

    return content_tag(:div, movie.title.first.upcase, class: "poster poster-#{size} poster-empty", "aria-hidden": true)
  end


  def displaydate(movie)

    if(movie.release_date)
      return movie.release_date.strftime("%b %-d, %Y")
    end

    return "—"
  end

end
