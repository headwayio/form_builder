class CreateVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :versions do |t|
      t.string :name
      t.belongs_to :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
