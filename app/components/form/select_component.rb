# frozen_string_literal: true

class Form::SelectComponent < ViewComponent::Form::SelectComponent
  def html_class
    class_names(
      "w-fit rounded-lg p-2 border-2 border-[#0003]"
    )
  end
end