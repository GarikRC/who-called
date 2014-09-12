class PhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer  :user_id
      t.string  :number
    end
  end
end
