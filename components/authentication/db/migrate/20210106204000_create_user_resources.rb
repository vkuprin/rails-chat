# frozen_string_literal: true

class CreateUserResources < ActiveRecord::Migration[6.0]
  def change
    create_table :user_resources do |t|
      t.string :user_id, limit: 36, null: false
      t.string :resource_type
      t.string :resource_id
      t.index %w[user_id resource_type resource_id], name: "unique_user_resources", unique: true

      t.timestamps
    end
  end
end
