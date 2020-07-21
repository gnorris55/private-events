class SessionsController < ApplicationController
    def new 
        
    end

    def create
        @user = User.find_by(name: params[:q])
        if @user.present?
            session[:current_user_name] = @user.name
            session[:logged_in] = true
            redirect_to root_path
        else
            redirect_to new_session_path
        end
        
    end 

    def log_out
        session[:current_user_name] = nil
        session[:logged_in] = false
        redirect_to root_path
    end
end
