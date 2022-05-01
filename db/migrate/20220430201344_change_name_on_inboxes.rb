class ChangeNameOnInboxes < ActiveRecord::Migration[7.0]
  def change
    change_column :inboxes, :name, :string, :null => false
  end
end
