class CoursesController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        if param[:topic_name]
            @courses =Course.search(param[:topic_name])
        else
            @course = Recipe.beta.all
        end
    end 
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
    def show
        @course = Course.find_by_id(param[:id])
    end

    def edit 
        @course = Course.fin(param[:id])

    end

    def update 
        @course = current_student.courses.find(param[:id])
        if @course.update(course_params)
            redirect_to course_path(@course)


        else
            @error = @course.errors.full_messages
            render :edit
        end
    end

    private 

    def course_params
        params.require(:course).permit(:topic,:roomNumber,:profesorName,
        :startDate,:endDate,:beginningTime,:endingTime,:requirements)

    end
end
