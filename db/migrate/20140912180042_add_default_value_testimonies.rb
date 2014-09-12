class AddDefaultValueTestimonies < ActiveRecord::Migration
  def change
    change_column :testimonies, :tally, :integer, default: 0
  end
end
