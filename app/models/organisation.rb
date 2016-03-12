class Organisation < ActiveRecord::Base
  has_many :volunteer_opportunities, dependent: :destroy
end
