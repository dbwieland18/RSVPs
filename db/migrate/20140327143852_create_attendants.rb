class CreateAttendants < ActiveRecord::Migration
  def change
    create_table :attendants do |t|
      t.string :name
    end
  end
end
