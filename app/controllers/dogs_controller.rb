class DogsController < ApplicationController
    def index
      @dogs = Dog.sorted(params[:sort])
    end

    def new
      @dog = Dog.new
    end

    def create
        @dog = Dog.new(dog_params)
        if @dog.valid?
            @dog.save
            redirect_to dog_path(@dog)
        else
            flash[:notice] = @dog.errors.full_messages
            render :new
        end
    end

    def show
      @dog = Dog.find(params[:id])
    end

    def edit
      @dog = Dog.find(params[:id])
    end

    def update
      @dog = Dog.find(params[:id])
      if @dog.update(dog_params)
        redirect_to dog_path(@dog)
      else
        flash[:notice] = @dog.errors.full_messages
        render :new
      end
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :sort)
    end
end
