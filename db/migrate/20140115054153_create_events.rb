class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :url
      t.text :description
      t.date :date
      t.time :start_time
    end
  end
end
