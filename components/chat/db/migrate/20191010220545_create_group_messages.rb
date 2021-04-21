# frozen_string_literal: true

class CreateGroupMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :group_messages do |t|
      t.references :group, null: false, foreign_key: true
      t.string :user_id
      t.text :message, null: false

      t.timestamps
    end
  end
end
