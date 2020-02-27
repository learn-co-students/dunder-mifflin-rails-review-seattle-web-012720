class DogsController < ApplicationController

    def index
        @dogs = Dog.all 
    end

    def show
        @dog = Dog.find(params[:id])
        @employees = Employee.all
    end

    def new

    end

    def create

    end

    def edit 
        @dog = Dog.find(params[:id])

    end

    def update
        @dog = Dog.find(params[:id])

    end

    private 
    def dog_params 
        params.require(:dog).permit(:name, :breed, :age)
    end

    def employee_params 
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end
end
