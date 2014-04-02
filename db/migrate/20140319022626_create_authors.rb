class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :user
      t.string :name
      t.date :birth
      t.string :address
      t.string :ctype
      t.string :photo
      t.timestamps
    end
  end
end
