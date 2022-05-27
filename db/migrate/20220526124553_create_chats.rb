class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :name

      t.timestamps
    end
    add_index :chats, :name, unique: false
  end
end
