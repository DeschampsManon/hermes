module ApplicationHelper

  def flash_messages_helper(_opts = {})
    flash.each do |msg_type, message|
      concat(
          content_tag(
              :div,
              message,
              class: "alert #{bootstrap_class_for(msg_type)} flash-alert fade in"
          ) do
            concat content_tag(:p, ("<span>#{I18n.t(msg_type)}</span>").html_safe, class: 'msg-type')
            concat content_tag(:button,
                               'x',
                               class: 'close',
                               data: { dismiss: 'alert' })
            concat content_tag(:div, message.html_safe)
          end
      )
    end
    nil
  end

  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      notice:  'alert-success',
      error:   'alert-danger',
      alert:   'alert-danger'
    } [flash_type.to_sym] || flash_type.to_s
  end

end
