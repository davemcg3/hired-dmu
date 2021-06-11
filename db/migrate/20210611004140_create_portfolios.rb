class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.string :description
      t.string :cta

      t.timestamps
    end
  end
end
