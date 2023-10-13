class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :input_type
      t.jsonb :metadata, default: {}
      t.boolean :required, default: false, null: false
      t.integer :position, null: false
      t.belongs_to :version, null: false, foreign_key: true

      t.timestamps
    end
  end
end
