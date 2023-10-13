# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  input_type :integer
#  metadata   :jsonb
#  position   :integer          not null
#  required   :boolean          default(FALSE), not null
#  text       :string
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
  acts_as_list scope: :version
  
  store :metadata, accessors: [:options, :grid]

  enum :input_type, {
    text_field: 0,
    number_field: 1,
    email_field: 2,
    phone_field: 3,
    text_area: 4,
    select: 5,
    radio_buttons: 6,
    checkboxes: 7,
    date: 8,
    time: 9
  }, prefix: :input_type

  validates :text, :input_type, presence: true

  belongs_to :version

  default_scope { order(position: :asc) }
end
