# == Schema Information
#
# Table name: responses
#
#  id          :bigint           not null, primary key
#  submited_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  version_id  :bigint           not null
#
# Indexes
#
#  index_responses_on_version_id  (version_id)
#
# Foreign Keys
#
#  fk_rails_...  (version_id => versions.id)
#
class Response < ApplicationRecord
  belongs_to :version
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: :reject_answer?

  private

  def reject_answer?(attr)
    attr['text'].blank? && Question.includes(:children).find(attr['question_id']).children.present?
  end
end
