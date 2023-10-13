# frozen_string_literal: true

class Form::DateFieldComponent < ViewComponent::Form::DateFieldComponent
  def html_class
    class_names(
      "w-full border-0 border-b-2 border-[#0003] focus:ring-0"
    )
  end
end