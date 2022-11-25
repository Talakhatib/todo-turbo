class TodoItemsController < ApplicationController

    def create
        @todo = Todo.find(params[:todo_id])
        @todo_item = @todo.todo_items.build(description: params[:description])
        respond_to do |format|
          if @todo_item.save!
            # flash[:success]="Successfuly added new todo item !"
            format.turbo_stream
            format.html{redirect_to @todo}
          end
        end
    end

    def mark_complete
      @todo_item = TodoItem.find(params[:id])
      @todo = @todo_item.todo_id
      respond_to do |format|
        if @todo_item.update!(completed: true)
          format.turbo_stream
          format.html{redirect_to @todo}
        end
      end 
    end

    def mark_incompleted
      @todo_item = TodoItem.find(params[:id])
      @todo = @todo_item.todo_id
      respond_to do |format|
        if @todo_item.update!(completed: false)
          format.turbo_stream
          format.html{redirect_to @todo}
        end
      end 
    end

    def destroy
      @todo_item = TodoItem.find(params[:id])
      @todo = @todo_item.todo
      @todo_item.destroy
      respond_to do |format|
        format.turbo_stream
        format.html{redirect_to @todo}
      end
    end

end
