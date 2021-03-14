class ChangeChannelAndRepliesColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :replies, :reply, :reply_text
    rename_column :channels, :channel, :name
  end
end
