class RecordsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        records = Record.all
        render json: records
    end

    def show
        record = find_record
        render json: record
    end

    def create
        record = record.create!(record_params)
        render json: record, status: :created
    end

    def update
        record = find_record
        record.update!(record_params)
        render json: record
    end

    def destroy
        record = find_record
        record.destroy
        head :no_content
    end

    private
    
    def find_record
        Record.find(params[:id])
    end

    def record_params
        params.permit(:last_record, :patient_id, :doctor_id, :medication)
    end

    def render_not_found_response
        render json: { error: "Record not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end