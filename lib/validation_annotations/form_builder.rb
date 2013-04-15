require 'action_view'

module ValidationAnnotations
  class FormBuilder < ActionView::Helpers::FormBuilder

    def initialize(object_name, object, template, options, proc)
      @skip_annotations = !options[:validation_annotations].nil? && options[:validation_annotations] === false
      super(object_name, object, template, options, proc)
    end

    def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      options = setup_validation_options(method, options)
      super(method, options, checked_value, unchecked_value)
    end

    def password_field(method, options = {})
      options = setup_validation_options(method, options)
      super(method, options)
    end

    def text_area(method, options = {})
      options = setup_validation_options(method, options)
      super(method, options)
    end

    def text_field(method, options = {})
      options = setup_validation_options(method, options)
      super(method, options)
    end

    def radio_buttons(method, options, &block)
      options = setup_validation_options(method, options)
      options[:class].push("radio") if options[:class].is_a?(Array)

      @template.content_tag(:div, options, &block)
    end

    def check_boxes(method, options, &block)
      options = setup_validation_options(method, options)
      options[:class].push("checkboxes") if options[:class].is_a?(Array)

      @template.content_tag(:div, options, &block)
    end

    protected

      def setup_validation_options(attribute, options)
        return options if @skip_annotations

        validators = @object.class.validators_on(attribute) # the list of all validators assigned to attribute
        validators.each do |validator|
          next if skip_validation?(@object, validator.options)

          if validator.respond_to?(:add_html_annotations!)
            validator.add_html_annotations!(options)
          end
        end

        options.delete(:validate)
        options
      end

      def skip_validation?(object, voptions)
        if voptions[:if].present?
          return true if voptions[:if].is_a?(Proc)   && voptions[:if].call(object) == false
          return true if voptions[:if].is_a?(Symbol) && object.send(voptions[:if]) == false
        end

        if voptions[:unless].present?
          return true if voptions[:unless].is_a?(Proc)   && voptions[:unless].call(object) == true
          return true if voptions[:unless].is_a?(Symbol) && object.send(voptions[:unless]) == true
        end

        false
      end
  end
end