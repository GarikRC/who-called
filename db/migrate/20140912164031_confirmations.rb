class Confirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.integer :user_id
      t.integer :testimony_id
    end
  end
end
