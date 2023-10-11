# == Schema Information
#
# Table name: forms
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Form < ApplicationRecord
  validates :name, presence: true
end
