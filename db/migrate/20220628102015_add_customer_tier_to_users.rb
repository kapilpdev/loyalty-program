class AddCustomerTierToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :customer_tier, :integer, default: 0
  end
end
