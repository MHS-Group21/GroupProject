class CreateDiscussionReports < ActiveRecord::Migration[5.2]
  def change
    create_table :discussion_reports do |t|
      t.belongs_to :discussion
      t.belongs_to :user
      t.integer :review_status
      t.timestamps
    end
  end
end
