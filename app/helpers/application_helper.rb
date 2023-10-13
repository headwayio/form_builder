module ApplicationHelper
  def dynamic_fields_for(form, association, name = "Add", &)
    # stimulus:      controller v
    tag.ul data: { controller: "dynamic-fields sortable", sortable_animation_value: "150" } do
      safe_join([
                  # render existing fields
                  form.fields_for(association, &),

                  # render "Add" button that will call `add()` function
                  # stimulus:         `add(event)` v
                  button_tag("#{name} +", data: { action: "dynamic-fields#add" }, class: "text-interactive-on-light-default hover:text-interactive-on-light-hover"),

                  # render "<template>"
                  # stimulus:           `this.templateTarget` v
                  tag.template(data: { dynamic_fields_target: "template" }) do
                    form.fields_for(association, association.to_s.classify.constantize.new,
                                    child_index: "__CHILD_INDEX__", &)
                  end
                ])
    end
  end
end
