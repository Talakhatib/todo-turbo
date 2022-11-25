class CreateTodoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_items do |t|
      t.string :description
      t.boolean :completed
      t.integer :todo_list_id

      t.timestamps
    end
  end
end
