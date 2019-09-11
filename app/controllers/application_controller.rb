class ApplicationController < ActionController::Base
    before_action :logged_in

    def logged_in
        @notification = flash[:notification]
        @errors = flash[:errors]
        if session[:user_id]
            @logged_in_user = User.find(session[:user_id])
            @can_exchange = true
        end
    end


end
