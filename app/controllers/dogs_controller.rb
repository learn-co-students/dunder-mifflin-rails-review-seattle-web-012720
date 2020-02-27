class DogsController < ApplicationController
    def index
        @dogs = Dog.sorted(params[:sort])
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    def update
        @dog = Dog.create(dog_params)
        if @dog.valid?
            redirect_to @dog
        else 
            render :new
        end
    end

    def edit
        @dog = Dog.find(params[:id])
    end
    
    def update
        @dog = Dog.find(params[:id])
        @dog.update
        if @dog.valid?
            redirect_to @dog
        else
            render :new
        end
    end

    private
        def dog_params
            params.require(:dog).permit(:name, :breed, :age, :sort)
        end
end
