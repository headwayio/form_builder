# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  name       :string
#  position   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  version_id :bigint           not null
#
# Indexes
#
#  index_sections_on_version_id  (version_id)
#
# Foreign Keys
#
#  fk_rails_...  (version_id => versions.id)
#
class Section < ApplicationRecord
  acts_as_list scope: :version
  
  belongs_to :version
  has_many :questions, as: :parent, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
