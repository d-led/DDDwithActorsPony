class val OpenAccount
  let account_number: String
  let balance: I64

  new val create(account_number': String, balance': I64) =>
    account_number = account_number'
    balance = balance'

class val DepositFunds
  let amount: I64

  new val create(amount': I64) =>
    amount = amount'


class val WithdrawFunds
  let amount: I64

  new val create(amount': I64) =>
    amount = amount'


type Command is (OpenAccount | DepositFunds | WithdrawFunds)

trait CommandProcessor
  be process(command: Command val)


class val AccountOpened
  let account_number: String
  let initial_balance: I64

  new val create(account_number': String, initial_balance': I64) =>
    account_number = account_number'
    initial_balance = initial_balance'

  fun string(): String =>
    "AccountOpened account_number: "+account_number+", initial_balance: "+initial_balance.string()


class val FundsDeposited
  let account_number: String
  let amount: I64
  let balance: I64

  new val create(account_number': String, amount': I64, balance': I64) =>
    account_number = account_number'
    amount = amount'
    balance = balance'

  fun string(): String =>
    account_number + ": FundsDeposited amount: "+amount.string()+", balance: "+balance.string()


class val FundsWithdrawn
  let account_number: String
  let amount: I64
  let balance: I64

  new val create(account_number': String, amount': I64, balance': I64) =>
    account_number = account_number'
    amount = amount'
    balance = balance'

  fun string(): String =>
    account_number + ": FundsWithdrawn amount: "+amount.string()+", balance: "+balance.string()

type Events is (AccountOpened | FundsDeposited | FundsWithdrawn)

trait EventProcessor
  be process(event: Events val)
