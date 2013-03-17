require 'validation_annotations/version'
require 'validation_annotations/validations'
require 'validation_annotations/form_builder'

module ValidationAnnotations
  # Your code goes here...
end

require 'active_support'
ActiveSupport.on_load(:action_view) do
  ActionView::Base.default_form_builder = ValidationAnnotations::FormBuilder
end