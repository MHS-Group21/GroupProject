class AddVolunteerToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :volunteer, :Boolean, default: false
  end
end
