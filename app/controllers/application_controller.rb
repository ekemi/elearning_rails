class ApplicationController < ActionController::Base

    # Give access to method in the view
    helper_method :current_student, :logged_in?

    private 
    def current_student
        @current_student ||= Student.find_by_id(session[:student_id]) if session[:student_id]

    end

    def logged_in?
        !!session[:student_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
