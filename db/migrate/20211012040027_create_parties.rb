class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.date :day
      t.time :time
      t.string :title

      t.timestamps
    end
  end
end
