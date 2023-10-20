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
require "test_helper"

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
