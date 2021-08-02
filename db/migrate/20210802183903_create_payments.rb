class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
     
      t.string :token
      t.integer :user_id

      t.timestamps 
    end
  end
end
