class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :state
      t.boolean :female
      t.date :birth_date

      t.timestamps
    end
  end
end
