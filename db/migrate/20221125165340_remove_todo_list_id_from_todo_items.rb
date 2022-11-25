class RemoveTodoListIdFromTodoItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :todo_items, :todo_list_id, :integer
  end
end
