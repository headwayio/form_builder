class FormVersionService < ApplicationService
  def initialize(form_id)
    @form_id = form_id
  end
  
  def call
    @prev_version = form.latest
    @new_version = form.versions.create(name: bump_version_number)

    copy_questions if @new_version

    @new_version
  end

  private

  def copy_questions
    @prev_version.questions.each do |q|
      @new_version.questions.create(q.attributes.merge({id: nil}))
    end
  end

  def bump_version_number
    letter, number = @prev_version.name.split(" ")
    version_array = number.split(".")
    version_array[-1] = (version_array[-1].to_i + 1).to_s

    [letter, version_array.join(".")].join(" ")
  end

  def form
    @_form ||= Form.find(@form_id)
  end
end