class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user,          foreign_key: true
      t.references :lesson,          foreign_key: true

      t.timestamps
      #use_idとitem_idのセットの重複登録を防ぐ記述
      t.index [:user_id, :lesson_id], unique: true
    end
  end
end
