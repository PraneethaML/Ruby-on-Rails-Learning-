class StudentController < ApplicationController
  def index
    logger.debug "inside index"
    render json: Student.all
  end
  
  def new
    @student = Student.new
  end
  
  def create
    logger.debug "inside create"
    @student = Student.new(student_params)
    if @student.save
    render json: @student, status: :created, location: student_path(@student)
    else
    render json: @student.errors, status: :unprocessable_entity
    end
  end
  
  def show
    render json: Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      head :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
    head :no_content
    else
    render json: @student.errors, status: :unprocessable_entity
    end
  end
  
  def student_params
      params.require(:student).permit(:name, :subject, :grade)
    end

end
