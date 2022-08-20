module ApplicationHelper
  def to_idr(amount)
    number_to_currency(amount, unit: 'Rp', precision: 2)
  end
end
