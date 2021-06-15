class Portfolio < ApplicationRecord
  has_rich_text :description
  has_many :sections, :dependent => :destroy
  belongs_to :user

  # I can cheat the user here because a user can only update their own portfolio and this will only trigger after they do that.
  after_create_commit {broadcast_prepend_to "portfolios", locals: { user: user }}
  after_update_commit {broadcast_replace_to "portfolios", locals: { user: user }}
  after_destroy_commit {broadcast_remove_to "portfolios", locals: { user: user }}
end
