class AccountDepositWorker
  include Sidekiq::Worker
  include Turbo::Broadcastable

  sidekiq_options retry: 0

  def perform(account_id, amount, version)
    account = Account.find_by(id: account_id)
    case version
    when '1'
      account.deposit_for(amount.to_i)
    when '2'
      account.deposit_for_with_lock(amount.to_i)
    when '3'
      account.deposit_for_without_locking(amount.to_i)
    end
  end
end
