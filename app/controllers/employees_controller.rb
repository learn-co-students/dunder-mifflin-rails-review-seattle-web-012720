class EmployeesController < ApplicationController
  def index
    @employees = Employee.search(params[:search])
  end
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
        @employee.save
        redirect_to employee_path(@employee)
    else
        flash[:notice] = @employee.errors.full_messages
        render :new
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
        redirect_to employee_path(@employee)
    else
        flash[:notice] = @employee.errors.full_messages
        render :new
    end
  end
  
    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id, :search)
    end
end
