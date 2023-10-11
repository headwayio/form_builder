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
require "test_helper"

class VersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
