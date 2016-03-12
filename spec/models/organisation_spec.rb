require 'rails_helper'

describe Organisation do
  let(:org) { described_class.create!(name: 'Organisation 1') }

  describe '#volunteer_opportunities' do
    it 'is an association' do
      expect {
        org.volunteer_opportunities.create!(
          :name       => 'Opportunity 1',
          :start_date => Date.new(2015, 1, 1),
          :end_date   => nil,
        )
      }.to change {
        org.volunteer_opportunities.count
      }.by 1
    end

    it 'dependent destroys' do
      org.volunteer_opportunities.create!(
        :name       => 'Opportunity 1',
        :start_date => Date.new(2015, 1, 1),
        :end_date   => nil,
      )
      expect {
        org.destroy
      }.to change {
        org.volunteer_opportunities.reload.count
      }.by -1
    end
  end
end
