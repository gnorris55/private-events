class EventsController < ApplicationController
    

    def index
        @users = User.all
    end 

    def show 
        @event = Event.find(params[:id])
    end 

    def new
        if session[:logged_in]
            @event = Event.new
        else
            redirect_to new_session_path
            flash[:not_signed_in] = "sign in to post an event"
        end
    end 

    def create
        @user = User.find_by(name: session[:current_user_name])
        @user.events.build(event_params)

        if @user.save
            redirect_to user_path(@user.id)
            flash[:posted] = "you have posted an event"
        else
            redirect_to new_event_path
            flash[:post_not_valid] = "event not valid"
        end
    end

    private 
    
    def event_params
        params.require(:event).permit(:body, :date)
    end
end
