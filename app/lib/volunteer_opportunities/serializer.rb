module VolunteerOpportunities
  class Serializer
    def initialize(reader:)
      @reader = reader
    end

    def read_serialized_volunteer_opportunities
      ActiveModel::ArraySerializer.new(
        reader.read_volunteer_opportunities,
        {
          :each_serializer => VolunteerOpportunitySerializer,
          :meta            => meta,
          :root            => 'volunteer_opportunities',
        }
      )
    end

    private

    attr_reader :reader

    def meta
      {
        :moment_date_format => reader.moment_date_format,
      }
    end
  end
end
