class CreatePaymentPaymentTransactions < ActiveRecord::Migration
  def change
    create_table :payment_payment_transactions do |t|
      t.string :type
      t.string :txn_id
      t.string :txn_type
      t.string :payer_email
      t.string :payer_id
      t.string :payment_status
      t.datetime :payment_date
      t.integer :mc_gross
      t.integer :mc_fee
      t.string :mc_currency
      t.string :raw_post

      t.timestamps
    end
  end
end
