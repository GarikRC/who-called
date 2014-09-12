class Testimonies < ActiveRecord::Migration
  def change
    create_table :testimonies do |t|
      t.integer :user_id
      t.integer :phone_id
      t.string :description
      t.integer :tally
    end
  end
end
