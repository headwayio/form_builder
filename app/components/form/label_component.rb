# frozen_string_literal: true

class Form::LabelComponent < ViewComponent::Form::LabelComponent
  def html_class
    class_names(
      "font-semibold"
    )
  end
end