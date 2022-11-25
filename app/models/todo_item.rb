class TodoItem < ApplicationRecord

    belongs_to :todo , class_name:"Todo"

    scope :completed , -> do
        where(completed: true)
    end
end
