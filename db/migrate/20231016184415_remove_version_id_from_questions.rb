class RemoveVersionIdFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :version_id, :integer
  end
end
