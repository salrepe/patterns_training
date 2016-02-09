class RedNumbersError < StandardError; end
class BankAccount
  OPENING_COMISSION = 0.1

  def initialize(starting_balance)
    @starting_balance = starting_balance
    @balance = apply_opening_comission(@starting_balance)
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    future_balance = @balance - amount
    check_balance_is_positive(future_balance)

    @balance = future_balance
  end

  def balance
    @balance
  end

  private

  def apply_opening_comission(starting_balance)
    starting_balance * (1 - OPENING_COMISSION)
  end

  def check_balance_is_positive(balance)
    return if balance >= 0

    raise RedNumbersError.new('The account balance can not be negative')
  end
end
