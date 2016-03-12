require 'rails_helper'

describe VolunteerOpportunities::Presenter do
  let(:org) { Organisation.create!(name: 'Organisation 1') }
  let(:start_date) { Date.new(2015, 5, 15) }
  let(:end_date) { nil }
  let!(:vol_op) do
    VolunteerOpportunity.create!(
      :name         => 'Opportunity 1',
      :start_date   => start_date,
      :end_date     => end_date,
      :organisation => org
    )
  end
  let(:date_format) { '%m/%d/%Y' }
  subject do
    VolunteerOpportunities::Reader.new(
      organisation_id: org.id,
      date_format: date_format,
    ).read_volunteer_opportunities.first
  end

  describe '#id' do
    subject { super().id }

    it { expect(subject).to eq vol_op.id }
  end

  describe '#organisation_id' do
    subject { super().organisation_id }

    it { expect(subject).to eq vol_op.organisation_id }
  end

  describe '#is_current' do
    subject { super().is_current }

    it { expect(subject).to eq true }
  end

  describe '#name' do
    subject { super().name }

    it { expect(subject).to eq 'Opportunity 1' }
  end

  describe '#organisation_name' do
    subject { super().organisation_name }

    it { expect(subject).to eq 'Organisation 1' }
  end

  describe '#start_date' do
    subject { super().start_date }

    context 'when the date format is month first' do

      it { expect(subject).to eq '05/15/2015' }
    end

    context 'when the date format is year first' do
      let(:date_format) { '%Y/%m/%d' }

      it { expect(subject).to eq '2015/05/15' }
    end
  end

  describe '#end_date' do
    subject { super().end_date }

    context 'when end date is present' do
      let(:end_date) { Date.new(2016, 5, 15) }

      context 'when the date format is month first' do
        it { expect(subject).to eq '05/15/2016' }
      end

      context 'when the date format is year first' do
        let(:date_format) { '%Y/%m/%d' }

        it { expect(subject).to eq '2016/05/15' }
      end
    end

    context 'when end date is null' do
      it { expect(subject).to eq nil }
    end
  end

  describe '#duration' do
    subject { super().duration }
    context 'when end date is present' do
      let(:random_number) { rand(1..100) }
      let(:end_date) { start_date.advance(days: random_number) }

      it { expect(subject).to eq random_number }
    end

    context 'when end date is null' do
      it { expect(subject).to eq nil }
    end
  end
end
