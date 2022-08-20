class RandomsController < ApplicationController
  def index
    target_accounts = Account.publics
    range = (100_000...101_000).to_a
    range.each do |amount|
      account = target_accounts.sample
      AccountDepositWorker.perform_async(account.id, amount, params[:version])
    end
    redirect_to root_path
  end
end
