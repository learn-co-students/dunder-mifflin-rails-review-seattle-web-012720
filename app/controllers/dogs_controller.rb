class DogsController < ApplicationController

    def new
        @dog = Dog.new
    end

    def create 
        @dog = Dog.create(d_params)
            redirect_to @dog
    end

    def show 
        @dog = Dog.find(params[:id])
    end
    
    def index 
        @dogs = Dog.all
    end

    def edit 
        @dog = Dog.find(params[:id])
    end

    def update 
        @dog = Dog.find(params[:id])
        @dog.update(d_params)
        redirect_to @dog
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        redirect_to dogs_path
    end 

    private 

    def d_params
        params.require(:dog).permit(
            :name, 
            :breed,  
            :age
        )
    end
end
