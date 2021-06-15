class Section < ApplicationRecord
  has_rich_text :headline
  has_rich_text :body
  belongs_to :portfolio
  belongs_to :user # probably not needed and confuses things

  # I can cheat the user here because a user can only update their own section and this will only trigger after they do that.
  after_create_commit {broadcast_append_to "sections", locals: { user: user }}
  after_update_commit {broadcast_replace_to "sections", locals: { user: user }}
  after_destroy_commit {broadcast_remove_to "sections", locals: { user: user }}
end
