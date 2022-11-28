class Todo < ApplicationRecord
    
    belongs_to :user,class_name:"User"
    has_many :todo_items , foreign_key: :todo_id , class_name:"TodoItem", dependent: :destroy

    def total_items 
          @total_items ||= todo_items.count
    end

    def completed_items 
        @completed_items ||= todo_items.completed.count
    end

    def percent_complete
        return 0 if total_items == 0

        (100 * completed_items.to_f / total_items ).round(1) 
    end

    def status 
        case percent_complete.to_i
        when 0
            'Not Started'
        when 100 
            'Complete'
        else
            'In progress'
        end
    end

    def badge_color 
        case percent_complete.to_i
        when 0
            'danger'
        when 100 
            'success'
        else
            'primary'
        end
    end

end
