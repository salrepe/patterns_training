require_relative 'implementation'

describe 'Bai2 Parser' do
  it 'returns an object representing the header when the line starts with 01' do
    line = '01220320161234'

    result = Bai2Parser.parse(line)

    expect(result).to be_a(Header)
  end

  it 'returns an object representing the account when the line starts with 15' do
    line = '157895876475990USD'

    result = Bai2Parser.parse(line)

    expect(result).to be_a(Account)
  end

  it 'returns an object representing the account when the line starts with 16' do
    line = '161234500'

    result = Bai2Parser.parse(line)

    expect(result).to be_a(Transaction)
  end

  it 'raises an error if the line does not start by 01, 15 or 16' do
    line = '261234500'

    expect do
      Bai2Parser.parse(line)
    end.to raise_error('Incorrect beginning of file number')
  end
end
