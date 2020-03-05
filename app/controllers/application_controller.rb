class ApplicationController < ActionController::Base
    helper_method :current_user, :default_val

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def if_not_authenticated
        if !current_user
            flash[:alert] = 'Unauthorized acess! Login Here..'
            redirect_to root_url
        end
    end

    def default_val(article)
      if article.id.nil?
        '#ffffff'
      else
        article.bgcolor
      end
    end
end
