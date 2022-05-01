class AddIndexToInboxes < ActiveRecord::Migration[7.0]
  def change
    add_index :inboxes, :name, unique: true
  end
end
