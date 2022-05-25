class AddUserIdToTodolist < ActiveRecord::Migration[7.0]
  def change
    add_column :todolists, :user_id, :integer
  end
end
