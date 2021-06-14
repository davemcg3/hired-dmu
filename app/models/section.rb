class Section < ApplicationRecord
  has_rich_text :headline
  has_rich_text :body
  belongs_to :portfolio

  after_create_commit {broadcast_append_to "sections"}
  after_update_commit {broadcast_replace_to "sections"}
  after_destroy_commit {broadcast_remove_to "sections"}
end
