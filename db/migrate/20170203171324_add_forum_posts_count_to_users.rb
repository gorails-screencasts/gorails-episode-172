class AddForumPostsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :forum_posts_count, :integer, default: 0, null: false

    # User.find_each { |u| User.reset_counters(u.id, :forum_posts) }

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE users
           SET forum_posts_count = (SELECT count(1)
                                   FROM forum_posts
                                  WHERE forum_posts.user_id = users.id)
    SQL
  end
end
