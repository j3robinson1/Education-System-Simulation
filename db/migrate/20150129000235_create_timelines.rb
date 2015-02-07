class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.date :date
      t.timestamps null: false
    end
  end
end
