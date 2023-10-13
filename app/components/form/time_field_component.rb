# frozen_string_literal: true

class Form::TimeFieldComponent < ViewComponent::Form::TimeFieldComponent
  def html_class
    class_names(
      "w-full border-0 border-b-2 border-[#0003] focus:ring-0"
    )
  end
end