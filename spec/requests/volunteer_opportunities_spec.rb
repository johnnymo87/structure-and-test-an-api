require 'rails_helper'

describe 'VolunteerOpportunities json' do
  context 'index action' do
    let(:org) { Organisation.create!(name: 'Organisation 1') }
    let!(:vol_op) do
      org.volunteer_opportunities.create!([
        {
          :name       => 'Opportunity 1',
          :start_date => Date.new(2014, 5, 15),
          :end_date   => Date.new(2015, 5, 14),
        },
        {
          :name       => 'Opportunity 1',
          :start_date => Date.new(2015, 5, 15),
          :end_date   => nil,
        },
      ])
    end

    context 'when organisation is not found' do
      it 'returns error JSON' do
        get organisation_volunteer_opportunities_path(
          organisation_id: 'uuid',
          format: :json,
        )
        expect(response).to match_response_schema('errors')
      end
    end

    context 'when successful' do
      it 'returns volunteer opportunity JSON' do
        get organisation_volunteer_opportunities_path(
          organisation_id: org.id,
          format: :json,
        )
        expect(response).to match_response_schema('volunteer_opportunities')
      end
    end
  end
end
