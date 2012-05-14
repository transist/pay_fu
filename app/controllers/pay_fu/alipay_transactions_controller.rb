module PayFu
  class AlipayTransactionsController < ApplicationController
    include ActiveMerchant::Billing::Integrations

    def notify
      notify = Alipay::Notification.new(request.new_post)
      if notify.acknowledge
        if transaction = PayFu::AlipayTransaction.find_by_transaction_id(notify.trade_no)
          transaction.update_attributes(transaction_attributes(notify))
        else
          PayFu::AlipayTransaction.create(transaction_attributes(notify))
        end
      end
      render :nothing => true
    end

    def transaction_attributes(notify)
      @transaction_attributes ||= {
        :transaction_id => notify.trade_no,
        :transaction_type => notify.payment_type,
        :payment_status => notify.trade_status,
        :payment_date => notify.notify_time,
        :gross => notify.total_fee,
        :raw_post => notify.raw
      }
    end
  end
end
