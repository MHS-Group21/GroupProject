class AddQuizColumnToUser < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :quiz_complete, :Boolean, default: false
  end
end
