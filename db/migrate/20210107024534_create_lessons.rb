class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string  :name,             null: false
      t.text    :introduction,     null: false
      t.integer :prefecture_id,    null: false
      t.integer :price,            null: false


      t.text    :delivery,         null: false
      t.text    :bring,            null: false
      t.text    :recipe,           null: false
      t.text    :flow,             null: false
      t.string :eventday,         null: false
      t.string :deadline,         null: false
      t.integer :capacity_id,      null: false
      t.references :user,          foreign_key: true



      t.timestamps
    end
  end
end
