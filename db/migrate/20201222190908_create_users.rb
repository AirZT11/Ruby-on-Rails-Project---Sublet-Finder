class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_number
      t.integer :age
      t.string :occupation
      t.text :bio
      t.string :social_media
      

      t.timestamps
    end
  end
end
