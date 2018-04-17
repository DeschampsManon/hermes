# frozen_string_literal: true

module ApplicationHelper
    def flash_messages_helper
        flash.each do |msg_type, messages|
            # messages.each do |message|
            concat(
                content_tag(
                    :div,
                    class: "alert #{bootstrap_class_for(msg_type)} flash-alert fade in"
                ) do
                    concat content_tag(:p,
                                       "<span>#{I18n.t(msg_type)}</span>".html_safe,
                                       class: 'msg-type')
                    concat content_tag(:button,
                                       'x',
                                       class: 'close',
                                       data: { dismiss: 'alert' })
                    concat content_tag(:div, messages.html_safe)
                end
            )
            # end if messages.class == 'Array'
        end
        nil
    end

    def devise_flash_messages_helper
        resource.errors.messages.each do |key, value|
            concat(
                content_tag(
                    :div,
                    class: ''
                ) do
                    concat content_tag(:p,
                                       "<span>#{I18n.t('error')}</span>".html_safe,
                                       class: 'msg-type')
                    concat content_tag(:button,
                                       'x',
                                       class: 'close',
                                       data: { dismiss: 'alert' })
                    concat content_tag(:div, "<h5>#{key}</h5> <p>#{key.to_s.capitalize} #{value[0]}</p>".html_safe)
                end
            )
        end
        nil
    end

    def bootstrap_class_for(flash_type)
        {
            success: 'alert-success',
            notice:  'alert-success',
            error:   'alert-danger',
            alert:   'alert-danger'
        } [flash_type.to_sym] || flash_type.to_s
    end
end
