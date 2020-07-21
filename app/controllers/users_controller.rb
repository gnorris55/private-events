class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def search
        @user = User.find_by(name: params[:q])
        
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to root_path
        else
            redirect_to new_user_path
        end
    end 

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to root_path
        else
            redirect_to edit_user_path
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end

    private 

    def user_params
        params.require(:user).permit(:name, :username, :favourite_number)
    end
end