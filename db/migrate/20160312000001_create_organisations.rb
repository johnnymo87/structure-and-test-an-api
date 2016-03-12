class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations, id: :uuid do |t|
      t.string :name, null: false, default: ''
      t.timestamps null: false
    end
  end
end
