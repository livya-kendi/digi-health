class AppointmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        appointments = Appointment.all
        render json: appointments
    end

    def show
        appointment = find_Appointment
        render json: appointment
    end

    def create
        appointment = Appointment.create!(appointment_params)
        render json: appointment, status: :created
    end

    def update
        appointment = find_appointment
        appointment.update!(appointment_params)
        render json: appointment
    end

    def destroy
        appointment = find_appointment
        appointment.destroy
        head :no_content
    end

    private
    
    def find_appointment
        Appointment.find(params[:id])
    end

    def appointment_params
        params.permit(:patient_id, :doctor_id, :start, :end, :reason)
    end

    def render_not_found_response
        render json: { error: "Appointment not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
