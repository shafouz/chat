class AddAccountStatusToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account_status, :string, default: 'active'
  end
end
