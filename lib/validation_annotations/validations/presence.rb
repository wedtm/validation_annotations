module ValidationAnnotations
  module Validations
    module Presence
      def add_html_annotations!(options)
        options['required'] = 'required'
      end
    end
  end
end

module ActiveModel
  module Valdiators
    class PresenceValidator
      include ValidationAnnotations::Validations::Presence
    end
  end
end