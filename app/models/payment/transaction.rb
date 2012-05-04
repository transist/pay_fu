module Payment
  class Transaction < ActiveRecord::Base
    attr_accessible :mc_currency, :mc_fee, :mc_gross, :payer_email, :payer_id, :payment_date, :payment_status, :raw_post, :txn_id, :txn_type, :type
  end
end
