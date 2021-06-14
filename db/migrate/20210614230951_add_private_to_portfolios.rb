class AddPrivateToPortfolios < ActiveRecord::Migration[6.1]
  def change
    add_column :portfolios, :private, :boolean, default: false
  end
end
