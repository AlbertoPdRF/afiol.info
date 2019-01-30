module ApplicationHelper
  def page_title(page_title = "")
    base_title = "Alberto Pérez de Rada Fiol"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def fa_icon(id)
    content_tag :i, "", class: "fa fa-#{id}"
  end
end
