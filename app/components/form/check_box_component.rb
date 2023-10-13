# frozen_string_literal: true

class Form::CheckBoxComponent < ViewComponent::Form::CheckBoxComponent
  def html_class
    class_names(
      "rounded-md border border-[#0003]"
    )
  end
end