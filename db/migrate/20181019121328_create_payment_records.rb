class CreatePaymentRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_records do |t|
      t.string :name
      t.float :money
      t.integer :user_id

      t.timestamps
    end
  end
end
