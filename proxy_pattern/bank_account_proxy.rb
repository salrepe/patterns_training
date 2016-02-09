require_relative 'bank_account'

class BankAccountProxy
  def initialize(starting_balance)
    @starting_balance = starting_balance
  end

  def balance
    bank_account.balance
  end

  def deposit(amount)
    bank_account.deposit(amount)

    self
  end

  def withdraw(amount)
    bank_account.withdraw(amount)

    self
  end

  private

  def bank_account
    return @bank_account if @bank_account
    @bank_account = BankAccount.new(@starting_balance)
  end
end
