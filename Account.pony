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

  be process(command: Command val) =>
    match command
      | let c: OpenAccount val =>
        _state = State(c.account_number, c.balance)
        let state = _state
        _receiver.process(AccountOpened(state.account_number, state.balance))

      | let c: DepositFunds val =>
        _state = State(_state.account_number, _state.balance+c.amount)
        let state = _state
        _receiver.process(FundsDeposited(state.account_number, c.amount, state.balance))

      | let c: WithdrawFunds val =>
        _state = State(_state.account_number, _state.balance-c.amount)
        let state = _state
        _receiver.process(FundsWithdrawn(state.account_number, c.amount, state.balance))
      end
