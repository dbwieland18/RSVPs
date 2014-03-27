class CreateFooditems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :guest_name
      t.string :description
    end
  end
end
