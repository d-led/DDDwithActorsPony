actor Main
  new create(env: Env) =>
    // version 1
    let printer = Receiver(env)
    var account = Account(env, printer)

    account.process(OpenAccount("A-1234",100))
    account.process(DepositFunds(50))
    account.process(WithdrawFunds(75))

    // version 2
    let simpler_receiver = SimplerReceiver(env)
    let simpler_account = SimplerAccount("A-5678", 100, simpler_receiver)
    simpler_account.deposit_funds(50)
    simpler_account.withdraw_funds(75)