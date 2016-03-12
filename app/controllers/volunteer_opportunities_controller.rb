class VolunteerOpportunitiesController < ApplicationController
  def index
    read_volunteer_opportunities
  end

  private

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {
      message: e.message,
      errors: [],
    }, status: :not_found
  end

  def read_volunteer_opportunities
    render json: reader.read_serialized_volunteer_opportunities
  end

  def reader
    VolunteerOpportunities::Reader.new(read_attributes)
  end

  def read_attributes
    {
      organisation_id: params[:organisation_id]
    }
  end
end
