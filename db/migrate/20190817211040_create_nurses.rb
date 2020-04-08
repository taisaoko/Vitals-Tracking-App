class CreateNurses < ActiveRecord::Migration
  def change
    create_table :nurses do |t|
      t.string :name
      t.integer :badge_number
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
