class Portfolio < ApplicationRecord
  has_rich_text :description

  after_create_commit {broadcast_prepend_to "portfolios"}
  after_update_commit {broadcast_replace_to "portfolios"}
  after_destroy_commit {broadcast_remove_to "portfolios"}
end
