actor Main
  new create(env: Env) =>
    let printer = Receiver(env)
    var account = Account(env, printer)

    account.process(recover OpenAccount("A-1234",100) end)
    account.process(recover DepositFunds(50) end)
    account.process(recover WithdrawFunds(75) end)

actor Receiver is EventProcessor
  let _env : Env

  new create(env: Env) =>
    _env = env

  be process(event: Events val) =>
    _env.out.print(event.string())
