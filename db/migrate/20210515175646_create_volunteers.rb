class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.boolean :questionaire, default: false
      t.boolean :verified, default: false
      t.string :full_name
      t.integer :questionaire_attempts, default: 0
      t.belongs_to :user

      t.timestamps
    end

    remove_column :users, :quiz_complete
  end
end
