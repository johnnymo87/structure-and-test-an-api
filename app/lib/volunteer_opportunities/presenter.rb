module VolunteerOpportunities
  class Presenter
    alias :read_attribute_for_serialization :send

    def initialize(volunteer_opportunity:, date_format:)
      @volunteer_opportunity = volunteer_opportunity
      @date_format = date_format
    end

    extend Forwardable
    delegate [
      :id,
      :organisation_id,
      :is_current,
      :name,
    ] => :volunteer_opportunity

    def organisation_name
      volunteer_opportunity.organisation.name
    end

    def start_date
      volunteer_opportunity.start_date.strftime(date_format)
    end

    def end_date
      volunteer_opportunity.end_date.try(:strftime, date_format)
    end

    def duration
      volunteer_opportunity.end_date.try(:-, volunteer_opportunity.start_date).try(:to_i)
    end

    private

    attr_reader :volunteer_opportunity, :date_format
  end
end
