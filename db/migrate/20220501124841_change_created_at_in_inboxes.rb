class ChangeCreatedAtInInboxes < ActiveRecord::Migration[7.0]
  def change
    change_column :inboxes, :created_at, :datetime, :precision => 6
  end
end
