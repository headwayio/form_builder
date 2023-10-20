class FormVersionService < ApplicationService
  def initialize(form_id)
    @form_id = form_id
  end
  
  def call
    @prev_version = form.latest
    @new_version = form.versions.create(name: @prev_version.name + 1)

    copy_sections if @new_version

    @new_version
  end

  private

  def copy_sections
    @prev_version.sections.each do |section|
      @prev_section = section
      @new_section = @new_version.sections.create(section.attributes.merge({id: nil}))
      
      copy_questions
    end
  end

  def copy_questions
    @prev_section.questions.each do |q|
      @new_section.questions.create(q.attributes.merge({id: nil}))
    end
  end

  def form
    @_form ||= Form.find(@form_id)
  end
end