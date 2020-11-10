

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
    redirect_if_not_logged_in
    #find_by = looking for something specific if it does not it produces Null. find_by(title: "")
    #find = return the object with the specific ID or break if it does not find something
    @student = Student.find_by_id(params[:id])
    redirect_to '/' if !@student
 end

 private

 def student_params
    params.require(:student).permit(:firtName,
    :lastName,
    :dateOfBirth,:address,:gender,:phoneNumber,:username,:password)
end
end