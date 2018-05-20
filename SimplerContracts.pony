trait SimplerEventProcessor
  be account_opened(account_number: String, initial_balance: I64)
  be funds_deposited(account_number: String, amount: I64, balance: I64)
  be funds_withdrawn(account_number: String, amount: I64, balance: I64)
