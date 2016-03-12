require 'rails_helper'

describe VolunteerOpportunity do
  describe '#organisation' do
    let(:org) { Organisation.create!(name: 'Organisation 1') }
    let!(:vol_op) do
      described_class.create!(
        :name         => 'Opportunity 1',
        :start_date   => Date.new(2015, 1, 1),
        :end_date     => nil,
        :organisation => org
      )
    end

    it 'is an association' do
      expect(
        described_class.find_by!(name: vol_op.name).organisation
      ).to eq org
    end
  end

  describe '::with_is_current' do
    subject do
      described_class.create!(
        :name         => 'Opportunity 1',
        :start_date   => start_date,
        :end_date     => end_date,
        :organisation => Organisation.create!,
      )
      described_class.with_is_current.first.is_current
    end

    context 'when start date is in the past' do
      let(:start_date) { Date.current.advance(days: -10) }

      context 'when end date is in the past' do
        let(:end_date) { Date.current.advance(days: -1) }

        it { expect(subject).to eq false }
      end

      context 'when end date is today' do
        let(:end_date) { Date.current }

        it { expect(subject).to eq true }
      end

      context 'when end date is in the future' do
        let(:end_date) { Date.current.advance(days: 1) }

        it { expect(subject).to eq true }
      end

      context 'when end date is null' do
        let(:end_date) { nil }

        it { expect(subject).to eq true }
      end
    end

    context 'when start date is today' do
      let(:start_date) { Date.current }

      context 'when end date is present' do
        let(:end_date) { Date.current.advance(days: 1) }

        it { expect(subject).to eq true }
      end

      context 'when end date is null' do
        let(:end_date) { nil }

        it { expect(subject).to eq true }
      end
    end

    context 'when start date is in the future' do
      let(:start_date) { Date.current.advance(days: 1) }

      context 'when end date is present' do
        let(:end_date) { Date.current.advance(days: 10) }

        it { expect(subject).to eq false }
      end

      context 'when end date is null' do
        let(:end_date) { nil }

        it { expect(subject).to eq false }
      end
    end
  end
end
