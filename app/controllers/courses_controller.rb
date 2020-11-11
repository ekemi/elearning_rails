class CoursesController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        @params = params[:topic_name]
        if @params
            @courses =Course.search(params[:topic_name])
            @courses.each do |course|
                course
            end
        else
            @error = "No topic"
            @courses = Course.beta.all
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
        @course = Course.find_by_id(params[:id])
    end

    def edit 
        @course = Course.fin(params[:id])

    end

    def update 
        @course = current_student.courses.find(course_params[:id])
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
