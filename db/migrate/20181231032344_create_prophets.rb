class CreateProphets < ActiveRecord::Migration[5.2]
  def change
    create_table :prophets do |t|
      t.string :text, null: false
      t.datetime :published_at, null: false
      t.references :user
      t.timestamps
    end
  end
end
