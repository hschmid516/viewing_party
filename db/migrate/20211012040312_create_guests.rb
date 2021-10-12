class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.references :party, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :host

      t.timestamps
    end
  end
end
