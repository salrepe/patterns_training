require_relative 'bank_account_proxy'

describe BankAccountProxy do
  let(:proxy) { BankAccountProxy.new(100) }

  it 'returns the balance of an account with the 10% of opening comission applied' do
    expect(proxy.balance).to eq(90)
  end

  it 'deposits the given amount to the bank account balance' do
    proxy.deposit(200)
    expect(proxy.balance).to eq(290)
  end

  it 'depositing funds more than once increases the same account balance' do
    proxy.deposit(200)
    expect(proxy.balance).to eq(290)

    proxy.deposit(150)
    expect(proxy.balance).to eq(440)
  end

  it 'withdraws the given amount from the account balance' do
    proxy.withdraw(80)
    expect(proxy.balance).to eq(10)
  end

  it 'withdrawing funds more than once decreases the same account balance' do
    proxy.withdraw(80)
    expect(proxy.balance).to eq(10)

    proxy.withdraw(10)
    expect(proxy.balance).to eq(0)
  end

  it 'can not withdraw funds if the balance becomes negative' do
    expect(proxy.balance).to eq(90)
    expect { proxy.withdraw(100) }.to raise_error(RedNumbersError)
  end

  it 'allows to deposit or withdraw funds in the same operation' do
    proxy.deposit(15).withdraw(25).deposit(1000)
    expect(proxy.balance).to eq(1080)
  end
end
