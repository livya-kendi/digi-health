class PatientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        patients = Patient.all
        render json: patients
    end

    def show
        patient = find_patient
        render json: patient
    end

    def create
        patient = Patient.create!(patient_params)
        render json: patient, status: :created
    end

    def update
        patient = find_patient
        patient.update!(patient_params)
        render json: patient
    end

    def destroy
        patient = find_patient
        patient.destroy
        head :no_content
    end

    private
    
    def find_patient
        Patient.find(params[:id])
    end

    def patient_params
        params.permit(:first_name, :last_name, :age, :image_url, :location)
    end

    def render_not_found_response
        render json: { error: "Patient not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
