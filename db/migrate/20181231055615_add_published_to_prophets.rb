class AddPublishedToProphets < ActiveRecord::Migration[5.2]
  def change
    add_column :prophets, :published, :boolean, default: false
  end
end
