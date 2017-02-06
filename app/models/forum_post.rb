class ForumPost < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :forum_thread, counter_cache: true
end
