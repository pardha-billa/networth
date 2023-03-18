select
  fund_name,
  funds.nav,
  funds.nav_at,
  sum(amount) as amount,
  sum(transactions.amount/transactions.nav) as units
  from funds join transactions
  on funds.id = transactions.fund_id
  group by 1,2,3
  