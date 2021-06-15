class AddUserToSections < ActiveRecord::Migration[6.1]
  def change
    add_reference :sections, :user, null: false, foreign_key: true, default: 1
  end
end
