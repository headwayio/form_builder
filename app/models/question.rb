# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  metadata   :jsonb
#  text       :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  version_id :bigint           not null
#
# Indexes
#
#  index_questions_on_version_id  (version_id)
#
# Foreign Keys
#
#  fk_rails_...  (version_id => versions.id)
#
class Question < ApplicationRecord
  enum type: {
    0: :text_field,
    1: :number_field,
    2: :email_field,
    3: :phone_field,
    4: :text_area,
    5: :select,
    6: :radio_buttons,
    7: :checkboxes,
    8: :date,
    9: :time
  }

  validates :text, :type, presence: true

  belongs_to :version
end
