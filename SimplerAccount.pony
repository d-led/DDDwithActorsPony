actor SimplerAccount
  let _account_number: String
  let _receiver: SimplerEventProcessor tag

  var _balance: I64

  new create(account_number: String,
             balance: I64,
             receiver: SimplerEventProcessor tag) =>
    _receiver = receiver
    _account_number = account_number
    _balance = balance

    open_account()

  fun open_account() =>
    _receiver.account_opened(_account_number, _balance)

  be deposit_funds(amount: I64) =>
    _balance = _balance + amount
    _receiver.funds_deposited(_account_number, amount, _balance)

  be withdraw_funds(amount: I64) =>
    _balance = _balance - amount
    _receiver.funds_withdrawn(_account_number, amount, _balance)
