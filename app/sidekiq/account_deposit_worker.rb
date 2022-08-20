class AccountDepositWorker
  include Sidekiq::Worker

  sidekiq_options retry: 0

  def perform(account_id, amount)
    account = Account.find_by(id: account_id)
    account.deposit_for(amount.to_i)
  end
end
