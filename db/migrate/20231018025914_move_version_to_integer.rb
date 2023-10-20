class MoveVersionToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :versions, :name, 'integer USING CAST(name AS integer)'
  end
end
