class RemoveDefaultUserFromPortfoliosAndSections < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:portfolios, :user_id, nil)
    change_column_default(:sections, :user_id, nil)
  end
end
