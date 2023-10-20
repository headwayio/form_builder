class ResponsesController < ApplicationController
  before_action :set_response, :set_section
  helper_method :last_page?
  
  def new
    @response.answers.build(questions)
    @answers = @response.answers.filter { |a| a.question.parent == @section }
  end

  def edit
    @response.answers.build(questions)
    @answers = @response.answers.filter { |a| a.question.parent == @section }
  end

  def create
    if @response.update(response_parameters)
      go_to_next
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @response.update(response_parameters)
      go_to_next
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def go_to_next
    if last_page?
      redirect_to form_path(form)
    else
      redirect_to edit_form_response_path(form, @response, page: (params[:page] || 1) + 1)
    end
  end

  def questions
    @section.questions.map do |q| 
      next if @response.answers.find_by(question: q)
      if q.children.present?
        {question: q, children: q.children.map { |qq| Answer.find_or_initialize_by(question: qq, response: @response) }}
      else
        { question: q }
      end
    end.compact
  end

  def response_parameters
    params.require(:response).permit(answers_attributes: [:id, :question_id, :text])
  end

  def set_response
    @response ||= Response.find_by(id: params[:id]) || Response.new(version: form.latest)
  end

  def set_section
    @section ||= form.latest.sections.find_by(position: params[:page] || 1)
  end

  def last_page?
    @last = form.latest.sections.count == (params[:page].to_i || 1)
  end

  def form
    @_form ||= Form.find(params[:form_id])
  end
end