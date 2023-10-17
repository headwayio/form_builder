class ResponsesController < ApplicationController
  before_action :set_response
  
  def new
    @response.answers.build(questions)
  end

  def create
    if @response.update(response_parameters)
      redirect_to form_path(form)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def questions
    form.latest.questions.map do |q| 
      if q.children.present?
        {question: q, children: q.children.map { |qq| Answer.new(question: qq) }}
      else
        { question: q }
      end
    end
  end

  def response_parameters
    params.require(:response).permit(answers_attributes: [:id, :question_id, :text])
  end

  def set_response
    @response ||= Response.find_by(id: params[:id]) || Response.new(version: form.latest)
  end

  def form
    @_form ||= Form.find(params[:form_id])
  end
end