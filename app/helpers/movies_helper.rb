module MoviesHelper
  # Table header cell that links to a sort on +column+. Clicking the column that is
  # already sorted flips the direction; the active column gets a CSS class, an arrow,
  # and aria-sort so screen readers know the order too.
  def sortable_header(column, label)
    active = column == @sort_column
    next_direction = active && @sort_direction == "asc" ? "desc" : "asc"

    classes = [ "sortable" ]
    classes << "sorted sorted-#{@sort_direction}" if active
    aria_sort = active ? (@sort_direction == "asc" ? "ascending" : "descending") : "none"
    arrow = active ? (@sort_direction == "asc" ? "▲" : "▼") : "↕"

    content_tag(:th, class: classes.join(" "), "aria-sort": aria_sort, scope: "col") do
      link_to movies_path(sort: column, direction: next_direction), id: "#{column}_header" do
        safe_join([ label, " ", content_tag(:span, arrow, class: "sort-indicator", "aria-hidden": true) ])
      end
    end
  end

  def sorted_cell_class(column)
    "sorted-cell sorted-cell-#{@sort_direction}" if column == @sort_column
  end

  def release_date_display(movie)
    movie.release_date ? movie.release_date.strftime("%b %-d, %Y") : "—"
  end
end
