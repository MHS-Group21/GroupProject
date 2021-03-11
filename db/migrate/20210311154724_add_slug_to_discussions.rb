class AddSlugToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :slug, :string
  end
end
