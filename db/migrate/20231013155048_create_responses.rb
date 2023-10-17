class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.belongs_to :version, null: false, foreign_key: true
      t.datetime :submited_at

      t.timestamps
    end
  end
end
