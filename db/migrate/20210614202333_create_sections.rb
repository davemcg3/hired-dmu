class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :headline
      t.text :body
      t.string :cta_text
      t.string :cta_link
      t.belongs_to :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
