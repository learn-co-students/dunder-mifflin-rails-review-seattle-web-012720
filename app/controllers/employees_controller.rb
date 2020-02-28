class EmployeesController < ApplicationController 
    def new
        @employee = Employee.new
    end

    def create 
        @employee = Employee.create(e_params)
        if @employee.valid?
            redirect_to @employee
        else
            render :new
        end
    end

    def show 
        @employee = Employee.find(params[:id])
    end
    
    def index 
        @employees = Employee.all
    end

    def edit 
        @employee = Employee.find(params[:id])
    end

    def update 
        @employee = Employee.find(params[:id])
        if @employee.update(e_params)
            redirect_to @employee
        else
            render :edit
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end 

    private 

    def e_params
        params.require(:employee).permit(
            :first_name, 
            :last_name, 
            :alias, 
            :title, 
            :office, 
            :img_url, 
            :dog_id
        )
    end
end
