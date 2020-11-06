

class StudentsController < ApplicationController
 def new
    @student = Student.new
 end

 def create
    @student = Student.new(student_params)
    if @student.save
        #log them in
        session[:student_id] = @student.id 
        #redirect them to show 
        redirect_to @student 
    else
        render :new
    end

 end

 def show
 end

 private

 def student_params
    params.require(:student).permit(:firtName,
    :lastName,
    :dateOfBirth,:address,:gender,:phoneNumber,:username,:password)
end
end