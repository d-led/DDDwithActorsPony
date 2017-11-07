actor Main
  new create(env: Env) =>
    let printer = AccountPrinter(env)
    var account = Account(env, printer)

    account.process(recover OpenAccount("A-1234",100) end)
    account.process(recover DepositFunds(50) end)
    account.process(recover WithdrawFunds(75) end)

    // // sleep just to get all notifications
    // let delay: I32 = 1
    // @sleep[I32](delay)

actor AccountPrinter is EventProcessor
  let _env : Env

  new create(env: Env) =>
    _env = env

  be process(event: AccountOpened val) =>
    _env.out.print(event.string())

  be process(event: FundsDeposited val) =>
    _env.out.print(event.string())

  be process(event: FundsWithdrawn val) =>
    _env.out.print(event.string())
