class CoursesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @course = Course.new
    end

    def create 
        @course = current_student.courses.build(course_params)
    if @course.save
        #redirect them to show 
        redirect_to courses_path #"/courses"
    else
        render :new
    end
    end

    private 

    def course_params
        params.require(:course).permit(:topic,:roomNumber,:profesorName,
        :startDate,:endDate,:beginningTime,:endingTime,:requirements)

    end
end
