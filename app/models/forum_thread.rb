class ForumThread < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :forum_posts
end
