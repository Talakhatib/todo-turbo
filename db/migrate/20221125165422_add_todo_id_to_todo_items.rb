class AddTodoIdToTodoItems < ActiveRecord::Migration[7.0]
  def change
    add_column :todo_items, :todo_id, :integer
  end
end
