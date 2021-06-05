class KittensController < ApplicationController
    before_action :set_kitten, only: [:show,:edit,:update,:destroy]


    def new 
        @kitten = Kitten.new
    end 

    def index
        @kittens = Kitten.all
        respond_to do |format|
            format.html
            format.json {render :json => @kittens}
        end 
    end

    def show 
    end

    def edit   
    end

    def create
        @kitten = Kitten.create(kitten_params)
        if @kitten.save
            redirect_to kittens_path
        else
            render 'new'
        end
    end

    def update
        @kitten.update(kitten_params)
        redirect_to kittens_path 
    end

    def destroy
       @kitten.destroy
       redirect_to kittens_path, alert: "Cat deleted"
    end

    private

        def kitten_params
            params.require(:kitten).permit(:name, :age, :cuteness, :softness)
        end

        def set_kitten
            @kitten = Kitten.find(params[:id])
        end

end
