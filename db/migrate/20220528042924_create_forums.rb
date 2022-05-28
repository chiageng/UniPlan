class CreateForums < ActiveRecord::Migration[7.0]
  def change
    create_table :forums do |t|
      t.string :topic
      t.text :description

      t.timestamps
    end
  end
end
