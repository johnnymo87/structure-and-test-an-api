require 'rails_helper'

describe VolunteerOpportunities::Reader do
  describe '#read_volunteer_opportunities' do
    context 'when organisation is not found' do
      it 'raises an appropriate error' do
        expect {
          described_class.new(
            organisation_id: 'hello world'
          ).read_volunteer_opportunities
        }.to raise_error(
          ActiveRecord::RecordNotFound,
          "Couldn't find Organisation with 'id'=hello world"
        )
      end
    end

    context 'when successful' do
      let(:org) { Organisation.create!(name: 'Organisation 1') }
      let(:start_date) { Date.new(2015, 5, 15) }
      let(:end_date) { nil }
      let!(:vol_ops) do
        org.volunteer_opportunities.create!([
          {
            :name       => 'Opportunity 1',
            :start_date => Date.new(2015, 5, 15),
            :end_date   => Date.new(2016, 5, 14),
          },
          {
            :name       => 'Opportunity 2',
            :start_date => Date.new(2016, 5, 15),
            :end_date   => nil,
          },
        ])
      end
      let!(:unrelated_vol_op) do
        VolunteerOpportunity.create!(
          :name         => 'Opportunity 3',
          :start_date   => Date.new(2015, 5, 15),
          :end_date     => nil,
          :organisation => Organisation.create!(name: 'Organisation 2')
        )
      end

      it 'returns all related volunteer opportunities' do
        expect(
          described_class.new(
            organisation_id: org.id
          ).read_volunteer_opportunities.count
        ).to eq VolunteerOpportunity.count - 1
      end
    end
  end

  describe '#moment_date_format' do
    subject do
      described_class.new(
        organisation_id: nil,
        date_format: date_format,
      ).moment_date_format
    end

    context 'when date format is %m/%d/%Y' do
      let(:date_format) { '%m/%d/%Y' }

      it { expect(subject).to eq 'MM/DD/YYYY' }
    end

    context 'when date format is %Y/%m/%d' do
      let(:date_format) { '%Y/%m/%d' }

      it { expect(subject).to eq 'YYYY/MM/DD' }
    end
  end
end
