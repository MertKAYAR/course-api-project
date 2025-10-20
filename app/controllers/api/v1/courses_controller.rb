class Api::V1::CoursesController < ApplicationController
    # GET /api/v1/courses
    def index
      @courses = Course.all.includes(:instructor) 
      render json: @courses, include: [:instructor]
    end
  
    # GET /api/v1/courses/:id
    def show
      @course = Course.find(params[:id])
      # Eğitmen, kayıtlar, kayıtların öğrencileri ve sertifikaları dahil
      render json: @course, include: [
        :instructor, 
        enrollments: { 
          include: [:student, :certificate] 
        }
      ]
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Kurs bulunamadı" }, status: :not_found
    end
  end