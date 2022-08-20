class ResetsController < ApplicationController
  def index
    Account.update_all(balance: 0)
    Deposit.delete_all
    LedgerEntry.delete_all
    redirect_to root_path
  end
end
