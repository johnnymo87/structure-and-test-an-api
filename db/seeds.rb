def print_inline(message)
  print message
  $stdout.flush
end

print_inline "Creating organisations: "

org1 = Organisation.create!(
  :id   => '00000000-0000-0000-0000-000000000000',
  :name => 'Organisation 1'
)
print_inline "|"

org2 = Organisation.create!(
  :id   => '00000000-0000-0000-0000-000000000001',
  :name => 'Organisation 2'
)
print_inline "|\n"

print_inline "Creating volunteer opportunities: "

org1.volunteer_opportunities.create!(
  :name       => 'Opportunity 1',
  :start_date => Date.new(2014, 5, 15),
  :end_date   => Date.new(2015, 5, 14),
)
print_inline "|"

org1.volunteer_opportunities.create!(
  :name       => 'Opportunity 2',
  :start_date => Date.new(2015, 5, 15),
  :end_date   => nil,
)
print_inline "|"

org2.volunteer_opportunities.create!([
  {
    :name       => 'Opportunity 1',
    :start_date => Date.new(2014, 5, 15),
    :end_date   => nil,
  },
])
print_inline "|\n"
