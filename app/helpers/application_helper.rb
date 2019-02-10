module ApplicationHelper
  def page_title(page_title = "")
    base_title = "Alberto Pérez de Rada Fiol"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      danger: "alert-danger",
      warning: "alert-warning",
      info: "alert-info",

      recaptcha_error: "alert-danger",
    }[flash_type.to_sym] || flash_type.to_s
  end

  def fa_icon(id)
    content_tag :i, "", class: "fa fa-#{id}"
  end
end
