class DoctorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        doctors = Doctor.all
        render json: doctors
    end

    def show
        doctor = find_doctor
        render json: doctor
    end

    def create
        doctor = Doctor.create!(doctor_params)
        render json: doctor, status: :created
    end

    def update
        doctor = find_doctor
        doctor.update!(doctor_params)
        render json: Doctor
    end

    def destroy
        doctor = find_doctor
        doctor.destroy
        head :no_content
    end

    private
    
    def find_doctor
        Doctor.find(params[:id])
    end

    def doctor_params
        params.permit(:first_name, :last_name, :image_url, :description, :location)
    end

    def render_not_found_response
        render json: { error: "Doctor not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
