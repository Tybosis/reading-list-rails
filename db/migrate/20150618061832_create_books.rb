class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.text :review
      t.integer :rating
      t.text :genre

      t.timestamps null: false
    end
  end
end
