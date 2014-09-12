class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :phone_numbers, :number, :string
  end
end
