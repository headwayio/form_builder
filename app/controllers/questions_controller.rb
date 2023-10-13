class QuestionsController < ApplicationController
  def update
    @question = Question.find(params[:id])
    @question.update(question_parameters)

    head :no_content
  end

  private

  def question_parameters
    params.permit(:position, :id)
  end
end