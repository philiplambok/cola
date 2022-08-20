class HomeController < ApplicationController
  def index
    @accounts = Account.publics
  end
end
