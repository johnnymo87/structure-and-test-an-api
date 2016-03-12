class VolunteerOpportunity < ActiveRecord::Base
  belongs_to :organisation

  def self.with_is_current(given_date: Date.current)
    today = sanitize(given_date.to_s(:db))
    select <<-SQL
    volunteer_opportunities.*, volunteer_opportunities.id in (
      select id
      from volunteer_opportunities vo
      where vo.start_date <= coalesce(vo.end_date, #{today}::date)
      and daterange(
        vo.start_date
      , coalesce(vo.end_date, #{today}::date)
      , '[]'
      ) @> #{today}::date
    ) as is_current
    SQL
  end
end
