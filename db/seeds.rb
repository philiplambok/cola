def initialize_the_accounts
  Account.create!(name: 'cash', balance: 0)
  Account.create!(name: 'Bill John', balance: 0)
  Account.create!(name: 'Marie', balance: 0)
  Account.create!(name: 'Kokomi', balance: 0)
  Account.create!(name: 'Yuki Kato', balance: 0)
end

def initialize_the_balances
  accounts = Account.publics.each do |account|
    random_amount = (100_000..1_000_000).to_a.sample
    account.deposit_for(random_amount)
  end
end

initialize_the_accounts
initialize_the_balances

