# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  metadata   :jsonb
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  version_id :bigint           not null
#
# Indexes
#
#  index_answers_on_version_id  (version_id)
#
# Foreign Keys
#
#  fk_rails_...  (version_id => versions.id)
#
class Answer < ApplicationRecord
  belongs_to :version
end
