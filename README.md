# ValidationAnnotations

Experemental ruby gem for adding html5 attribute annotations to input fields based on active_model validations.

## Installation

Add this line to your application's Gemfile:

    gem 'validation_annotations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validation_annotations

## Usage

Out of the box, by adding the following to your model (using ActiveModel::Validations):

    class Product < ActiveRecord::Base
      validates_presence_of :title
    end

When you use a form_helper method in your view like this:

    f.text_field :title

It will render with a required='required' attribute in the html:

    <input type="text" name="product[title]" required="required" />

## Extending support for other validators

If you would like to add attribute annotations for other validators, you simply need to add
a add_html_annotations! instance method to the validator class. For example, if I wanted to add annotations for the validates_length_of:

    module ActiveModel
      module Validations
        class LengthValidator
          def add_html_annotations!(options)
            options['data-val-length-min'] = minimum
            options['maxlength'] = maximum
          end
        end
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
