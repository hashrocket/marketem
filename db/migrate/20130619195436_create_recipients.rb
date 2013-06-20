class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :full_name
      t.string :phone
      t.string :state
      t.string :gender

      t.timestamps
    end
  end
end
