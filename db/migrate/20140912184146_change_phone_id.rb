class ChangePhoneId < ActiveRecord::Migration
  def change
    rename_column :testimonies, :phone_id, :phone_number_id
  end
end
