class AddPolymorphicParentToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :parent_type, :string
  end
end
