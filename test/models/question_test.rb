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
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
