module PayFu
  class PaypalTransactionsController < ApplicationController
    include ActiveMerchant::Billing::Integrations

    def notify
      notify = Paypal::Notification.new(request.raw_post)
      if notify.acknowledge
        if transaction = PayFu::PaypalTransaction.find_by_transaction_id(notify.transaction_id)
          transaction.update_attributes(transaction_attributes(notify))
        else
          PayFu::PaypalTransaction.create(transaction_attributes(notify))
        end
      end
      render :nothing => true
    end

    def transaction_attributes(notify)
      @transaction_attributes ||= {
        :transaction_id => notify.transaction_id,
        :transaction_type => notify.type,
        :payment_status => notify.status,
        :payment_date => notify.received_at,
        :gross => notify.gross_cents,
        :raw_post => notify.raw
      }
    end
  end
end
