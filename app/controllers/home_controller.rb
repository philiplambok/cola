class HomeController < ApplicationController
  def index
    @accounts = Account.where.not(name: 'cash').order(id: :asc)
  end
end
