class State
  let account_number: String
  let balance: I64

  new create(account_number': String, balance': I64) =>
      account_number = account_number'
      balance = balance'

  fun string(): String =>
    "State account_number: "+account_number+" balance: "+ balance.string()



actor Account is CommandProcessor
  let _env : Env
  var _state: State = State("",0)
  let _receiver: EventProcessor tag

  new create(env: Env, receiver: EventProcessor tag) =>
    _receiver = receiver
    _env = env

  be process(command: OpenAccount val) =>
    _state = State(command.account_number, command.balance)
    let state = _state
    _receiver.process(recover AccountOpened(state.account_number, state.balance) end)

  be process(command: DepositFunds val) =>
    _state = State(_state.account_number, _state.balance+command.amount)
    let state = _state
    _receiver.process(recover FundsDeposited(command.amount, state.balance) end)

  be process(command: WithdrawFunds val) =>
    _state = State(_state.account_number, _state.balance-command.amount)
    let state = _state
    _receiver.process(recover FundsWithdrawn(command.amount, state.balance) end)
