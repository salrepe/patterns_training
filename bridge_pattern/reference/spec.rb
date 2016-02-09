require_relative 'reference_implementation'

describe Implementor do
  it 'defines the interface for implementation classes' do
    expect {
      described_class.new.operation
    }.to raise_error('Should be implemented in a sub class')
  end
end

describe ConcreteImplementor do
  it 'implements the Implementor interface' do
    expect(described_class.ancestors).to include(Implementor)
    expect(described_class.new.operation).to eq('Implemented Operation')
  end
end

describe Abstraction do
  it 'maintains the Implementor reference' do
    concrete_implemetor = ConcreteImplementor.new
    abstraction = described_class.new(concrete_implemetor)

    implementor = abstraction.instance_variable_get('@implementor')
    expect(implementor).to eq(concrete_implemetor)
  end

  it 'defines the abstract interface' do
    concrete_implemetor = ConcreteImplementor.new
    abstraction = described_class.new(concrete_implemetor)

    expect{
      abstraction.task
    }.to raise_error('Should be implemented in a sub class')
  end
end

describe RefinedAbstraction do
  it 'extends the interface defined by Abstraction' do
    refined_abstraction = described_class.new(ConcreteImplementor.new)
    refined_abstraction.apply_factor('Task through')

    expect(described_class.ancestors).to include(Abstraction)
    expect(refined_abstraction.task).to eq('Task through Implemented Operation')
  end
end

describe BridgePattern do
  describe '#main' do
    it 'returns the result of different tasks' do
      expect(described_class.main).to eq(['First task through Implemented Operation', 'Second task through Implemented Operation'])
    end
  end
end
