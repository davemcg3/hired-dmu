class RemoveCtaFromPortfolios < ActiveRecord::Migration[6.1]
  def change
    remove_column :portfolios, :cta, :string
  end
end
