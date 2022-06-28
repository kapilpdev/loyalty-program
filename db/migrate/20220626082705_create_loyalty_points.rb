class CreateLoyaltyPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalty_points do |t|
      t.integer :point, null: false
      t.boolean :point_expired, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
