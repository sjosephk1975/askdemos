class ChangeUpdatedAtInInboxes < ActiveRecord::Migration[7.0]
  def change
    change_column :inboxes, :updated_at, :datetime, :precision => 6
  end
end
