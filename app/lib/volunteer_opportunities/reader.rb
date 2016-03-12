module VolunteerOpportunities
  class Reader
    def initialize(organisation_id:, date_format: '%m/%d/%Y')
      @organisation_id = organisation_id
      @date_format = date_format
    end

    def read_serialized_volunteer_opportunities
      Serializer.new(reader: self).read_serialized_volunteer_opportunities
    end

    def read_volunteer_opportunities
      Organisation.find(organisation_id)
        .volunteer_opportunities
        .with_is_current
        .includes(:organisation)
        .map { |vo| make_presenter(vo) }
    end

    def moment_date_format
      DateFormats.find_by_ruby_string(date_format).fetch(:moment_string)
    end

    private

    attr_reader :organisation_id, :date_format

    def make_presenter(given_volunteer_opportunity)
      Presenter.new(
        volunteer_opportunity: given_volunteer_opportunity,
        date_format: date_format
      )
    end
  end
end
