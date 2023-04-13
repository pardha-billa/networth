select
  fund_name,
  max(funds.nav_at) as nav_at,
  sum(amount) as inv_value,
  sum((transactions.amount/transactions.nav)*funds.nav) as cur_value,
  sum(transactions.amount/transactions.nav) as units
  from funds join transactions
  on funds.id = transactions.fund_id
  group by 1