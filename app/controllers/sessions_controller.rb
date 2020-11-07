class SessionsController < ApplicationController


    def home
    end

    def destroy 
       session.clear
       redirect_to root_path # '/'
    end

    def new
    end

    def create 
        #always check how your params are
        @student = Student.find_by(username: params[:student][:username])
        if @student && @student.authenticate(params[:student][:password])
            session[:student_id] = @student.id
            redirect_to student_path(@student)#/students/'#{@student.id}'
        else
            
            flash[:message] = "incorrect info, please try again"
            redirect_to login_path #"/login"
        end
    end
end