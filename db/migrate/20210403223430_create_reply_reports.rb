class CreateReplyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_reports do |t|
      t.belongs_to :reply, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :review_status
      t.text :admin_comment
      t.timestamps
    end
  end
end
