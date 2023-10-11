class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :text
      t.jsonb :metadata
      t.belongs_to :version, null: false, foreign_key: true

      t.timestamps
    end
  end
end
