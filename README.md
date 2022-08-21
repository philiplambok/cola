# Cola

Experiment project for building highly reliable finance application.
 
Most inspired by big companies like Uber, Airbnb, Stripe, and Modern Treasury, how they handle concurrency transactions and write their accounting transactions.

Currently, the project only has one feature: a deposit feature. The feature allows users to add funds to their digital wallet balances.

The specs:
- Ruby on Rails 7.
- Redis. 
- Sidekiq with 30 concurrences jobs.
- PostgreSQL with 5 connection pools. 

I tried to implement three possible handlers for that feature:
- The correct way. 
- The wrong way v1 (SQL locking)
- The wrong way v2 (like option two, but without SQL locking)

This project also implements the [double-entry accounting system](https://www.moderntreasury.com/journal/what-is-double-entry-accounting) to help us reconcile the money movement more reliable. You can try the feature at [this link](https://colacolacola.herokuapp.com/).

Things you may want to cover:

* Ruby version

  ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [x86_64-darwin18]

* System dependencies
  Redis, and PostgreSQL

* Configuration

  None.

* Database creation

  rails db:create

* Database initialization

  rails db:migrate && rails db:seed
