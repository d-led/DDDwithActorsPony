actor SimplerReceiver is SimplerEventProcessor
  let _env : Env

  new create(env: Env) =>
    _env = env

  be account_opened(account_number: String, initial_balance: I64) =>
    _env.out.print("AccountOpened account_number: "+account_number+", initial_balance: "+initial_balance.string())

  be funds_deposited(account_number: String, amount: I64, balance: I64) =>
    _env.out.print(account_number + ": FundsDeposited amount: "+amount.string()+", balance: "+balance.string())

  be funds_withdrawn(account_number: String, amount: I64, balance: I64) =>
    _env.out.print(account_number + ": FundsWithdrawn amount: "+amount.string()+", balance: "+balance.string())
