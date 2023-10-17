# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  input_type  :integer
#  metadata    :jsonb
#  parent_type :string
#  position    :integer          not null
#  required    :boolean          default(FALSE), not null
#  text        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#
class Question < ApplicationRecord  
  acts_as_list scope: :parent
  
  store :metadata, accessors: [:options, :columns]

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
    time: 9,
    file: 10,
    checkbox_grid: 11,
    radio_grid: 12,
    mixed_grid: 13,
    free_text: 14
  }, prefix: :input_type

  validates :text, :input_type, presence: true

  belongs_to :parent, polymorphic: true
  has_many :answers
  has_many :children, class_name: 'Question', as: :parent, dependent: :destroy

  accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true 

  default_scope { order(position: :asc) }
end
