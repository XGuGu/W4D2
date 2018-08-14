class ChangePrimaryKeyToIntOnCats < ActiveRecord::Migration[5.2]
  def change
    change_column :cats, :id, :int
  end
end
