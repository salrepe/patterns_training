require_relative 'implementation'

describe 'Chain of Responsibility' do
  let(:first_handler) { FirstConcreteHandler.new }
  let(:second_handler) { SecondConcreteHandler.new }
  let(:third_handler) { ThirdConcreteHandler.new }

  before do
    first_handler.add_successor(second_handler)
    second_handler.add_successor(third_handler)
  end

  it 'handles the request with the FirstConcreteHandler if mets its criteria (value greater than 0)' do
    value = 1

    result = first_handler.handle(value)

    expect(result).to eq('FirstConcreteHandler handled request 1')
  end

  it 'handles the request with the SecondConcreteHandler if mets its criteria (value equal to 0)' do
    value = 0

    result = first_handler.handle(value)

    expect(result).to eq('SecondConcreteHandler handled request 0')
  end

  it 'handles the request with the ThirdConcreteHandler if mets its criteria (value less than 0)' do
    value = -1

    result = first_handler.handle(value)

    expect(result).to eq('ThirdConcreteHandler handled request -1')
  end
end
