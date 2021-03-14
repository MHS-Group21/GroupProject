class AddIdVerifyQuestionsDoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :id_verified, :boolean, default: false
    add_column :users, :questions_complete, :boolean, default: false
  end
end
