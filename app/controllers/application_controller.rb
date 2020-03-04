class ApplicationController < ActionController::Base
    helper_method :current_user

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def if_not_authenticated
        flash[:alert] = 'Unauthorized acess! Login Here..'
        redirect_to root_url
    end
end
