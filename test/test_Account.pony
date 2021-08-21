use "ponytest"
use "promises"

use sut = ".."

actor Main is TestList
  new create(env: Env) =>
    PonyTest(env, this)

  fun tag tests(test: PonyTest) =>
    test(_TestAccountEvents)

class iso _TestAccountEvents is UnitTest
  var balance_promise: Promise[I64] = Promise[I64]

  fun name(): String => "account events"


  fun apply(h: TestHelper) =>
    h.long_test(1_000_000_000)

    let rec = TestReceiver(balance_promise)

    let acc = sut.SimplerAccount("A-5678", 100, rec)
    expect_balance_to_be(h, 100)

    acc.deposit_funds(50)
    expect_balance_to_be(h, 150)

    acc.withdraw_funds(75)
    expect_balance_to_be(h, 75, true)


  fun expect_balance_to_be(h: TestHelper, balance': I64, finished: Bool = false) =>
    balance_promise.next[I64](recover this~assert_balance_eq(h, balance') end)

    if finished then
      h.complete(true)
    end


  fun tag assert_balance_eq(h: TestHelper, expected_balance: I64, balance': I64): I64 =>
    h.assert_eq[I64](expected_balance, balance')
    balance'

  fun timed_out(h: TestHelper) =>
    h.complete(false)


actor TestReceiver is sut.SimplerEventProcessor
  let _balance_promise: Promise[I64]

  new create(promise: Promise[I64]) =>
    _balance_promise = promise

  be account_opened(account_number: String, initial_balance: I64) =>
    _balance_promise(initial_balance)

  be funds_deposited(account_number: String, amount: I64, balance': I64) =>
    _balance_promise(balance')

  be funds_withdrawn(account_number: String, amount: I64, balance': I64) =>
    _balance_promise(balance')
