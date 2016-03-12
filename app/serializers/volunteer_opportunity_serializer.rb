class VolunteerOpportunitySerializer < ActiveModel::Serializer
  attributes :id,
    :organisation_id,
    :is_current,
    :name,
    :organisation_name,
    :start_date,
    :end_date,
    :duration
end
