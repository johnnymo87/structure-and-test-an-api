class CreateVolunteerOpportunities < ActiveRecord::Migration
  def change
    create_table :volunteer_opportunities, id: :uuid do |t|
      t.string :name, null: false, default: ''
      t.date :start_date, null: false
      t.date :end_date
      t.references :organisation, type: :uuid, foreign_key: true, index: true, null: false
      t.timestamps null: false
    end
  end
end
