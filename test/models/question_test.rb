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
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end