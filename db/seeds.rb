# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


def initialize_the_accounts
  Account.create!(name: 'cash', balance: 0)
  Account.create!(name: 'Bill John', balance: 0)
  Account.create!(name: 'Marie', balance: 0)
  Account.create!(name: 'Kokomi', balance: 0)
  Account.create!(name: 'Yuki Kato', balance: 0)
end


initialize_the_accounts