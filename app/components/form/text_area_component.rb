# frozen_string_literal: true

class Form::TextAreaComponent < ViewComponent::Form::TextAreaComponent
  def html_class
    class_names(
      "w-full rounded-lg p-2 border-2 border-[#0003]"
    )
  end
end