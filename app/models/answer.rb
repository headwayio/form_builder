# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  metadata    :jsonb
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#  response_id :bigint
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#  index_answers_on_response_id  (response_id)
#
class Answer < ApplicationRecord
  attr_accessor :children

  belongs_to :response
  belongs_to :question
end
