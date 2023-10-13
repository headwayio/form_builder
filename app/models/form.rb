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

  has_many :versions, dependent: :destroy
  has_many :questions, through: :versions

  accepts_nested_attributes_for :versions, reject_if: :all_blank, allow_destroy: true

  def latest
    versions.order(created_at: :desc).first
  end
end
