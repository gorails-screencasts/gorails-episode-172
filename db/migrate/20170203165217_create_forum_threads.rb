class CreateForumThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :forum_threads do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :forum_posts_count, default: 0, null: false

      t.timestamps
    end
  end
end
