class EmployeesController < ApplicationController
    def index
        @employees = Employee.all 
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new 
    end

    def create
     
        @employee = Employee.new(employee_params) 
         if @employee.valid?
             @employee.save
            redirect_to @employee 
         else 
            flash[:messages] = @employee.errors.full_messages
            render :new
         end

    end

    def edit 
        @employee = Employee.find(params[:id])

    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        
        if @employee.save
            redirect_to employees_path 
        else 
            flash[:messages] = @employee.errors.full_messages 
            render :edit
        end
            
    end

    private 
    def employee_params 
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end
end
