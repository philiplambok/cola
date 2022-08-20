class RandomsController < ApplicationController
  def index
    target_accounts = Account.publics
    range = (100_000..5_000_000).to_a
    1_000.times.each do
      account = target_accounts.sample
      amount = range.sample
      AccountDepositWorker.perform_async(account.id, amount)
    end
    redirect_to root_path
  end
end
