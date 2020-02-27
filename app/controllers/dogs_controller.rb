class DogsController < ApplicationController
    def index

        @dogs = Dog.all

    end




    def new

    end

    def create

    end





    def show
        @dog = Dog.all.find(params[:id])
    end






   
    def edit

    end

    def update

    end

    

    private

    def dog_params

    end


end
