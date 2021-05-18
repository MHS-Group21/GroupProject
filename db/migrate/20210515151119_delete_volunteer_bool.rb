class DeleteVolunteerBool < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :volunteer
  end
end
