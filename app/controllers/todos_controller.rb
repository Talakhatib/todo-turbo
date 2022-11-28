class TodosController < ApplicationController

    def show
        @todo = Todo.find(params[:id])
    end

    def index
        @todos=Todo.where(user_id: current_user.id)
    end
    def new
        @todo = Todo.new
    end
    def edit
        @todo=Todo.find(params[:id])
    end
    def create
        user = User.find( current_user.id)
        @todo = user.todos.build(todo_params)
        respond_to do |format|
          if @todo.save!
            # flash[:success]="Todo was successfuly created!!"
            format.turbo_stream
            format.html{redirect_to todos_path}
          end
        end
      end

      def update
        @todo = Todo.find(params[:id])

        respond_to do |format|
         if @todo.update!(todo_params)
            # flash[:info]="The Todo was updated!!"
            format.turbo_stream
            format.html{redirect_to todos_path}
         end
       end
     end

     def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        respond_to do |format|
           format.turbo_stream 
           format.html{redirect_to todos_path} 
        end
     end

      private 
      def todo_params 
        params.require(:todo).permit(:title)
      end
end
