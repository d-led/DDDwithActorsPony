actor Receiver is EventProcessor
  let _env : Env

  new create(env: Env) =>
    _env = env

  be process(event: Events val) =>
    _env.out.print(event.string())
