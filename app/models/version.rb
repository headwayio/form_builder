# == Schema Information
#
# Table name: versions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  form_id    :bigint           not null
#
# Indexes
#
#  index_versions_on_form_id  (form_id)
#
# Foreign Keys
#
#  fk_rails_...  (form_id => forms.id)
#
class Version < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :form
  has_many :questions, dependent: :destroy

  default_scope { order(created_at: :desc) }

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
