class OpenAccount
  let account_number: String
  let balance: I64

  new create(account_number': String, balance': I64) =>
    account_number = account_number'
    balance = balance'

class DepositFunds
  let amount: I64

  new create(amount': I64) =>
    amount = amount'


class WithdrawFunds
  let amount: I64

  new create(amount': I64) =>
    amount = amount'


type Command is (OpenAccount | DepositFunds | WithdrawFunds)

trait CommandProcessor
  be process(command: Command val)


class AccountOpened
  let account_number: String
  let initial_balance: I64

  new create(account_number': String, initial_balance': I64) =>
    account_number = account_number'
    initial_balance = initial_balance'

  fun string(): String =>
    "AccountOpened account_number: "+account_number+", initial_balance: "+initial_balance.string()


class FundsDeposited
  let account_number: String
  let amount: I64
  let balance: I64

  new create(account_number': String, amount': I64, balance': I64) =>
    account_number = account_number'
    amount = amount'
    balance = balance'

  fun string(): String =>
    account_number + ": FundsDeposited amount: "+amount.string()+", balance: "+balance.string()


class FundsWithdrawn
  let account_number: String
  let amount: I64
  let balance: I64

  new create(account_number': String, amount': I64, balance': I64) =>
    account_number = account_number'
    amount = amount'
    balance = balance'

  fun string(): String =>
    account_number + ": FundsWithdrawn amount: "+amount.string()+", balance: "+balance.string()

type Events is (AccountOpened | FundsDeposited | FundsWithdrawn)

trait EventProcessor
  be process(event: Events val)
