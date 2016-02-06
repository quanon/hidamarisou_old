class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :room, index: true, null: false
      t.text :body

      t.timestamps null: false
    end
  end
end
