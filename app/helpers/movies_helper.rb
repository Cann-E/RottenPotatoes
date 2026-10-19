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


  def sortcellclass(column)

    if(column == @sort_column)
      return "sorted-cell sorted-cell-#{@sort_direction}"
    end

    return nil
  end


  def displaydate(movie)

    if(movie.release_date)
      return movie.release_date.strftime("%b %-d, %Y")
    end

    return "—"
  end

end
