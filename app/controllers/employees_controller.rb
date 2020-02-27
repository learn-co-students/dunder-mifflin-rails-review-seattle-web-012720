class EmployeesController < ApplicationController

    def index
@employees = Employee.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
        #byebug
       
    end

    def show
        @employee = Employee.all.find(params[:id])
    end

    def create

        @employee = Employee.new(employee_create_params)
        if @employee.valid?
        @employee.save
        redirect_to employee_path(@employee)
        else
       render :new
        end
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_create_params)
        if @employee.valid?
        

        redirect_to employee_path(@employee)
        else
            
            render :edit
        end
    end

    def edit
        @employee = Employee.all.find(params[:id])
        
        @dogs = Dog.all
    end

    private

    def employee_params
        params.require(:employee).permit(:dog_id)
    end
    def employee_create_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end



end
