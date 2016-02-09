class Implementor
  def operation
    raise 'Should be implemented in a sub class'
  end
end

class ConcreteImplementor < Implementor
  def operation
    'Implemented Operation'
  end
end

class Abstraction
  def initialize(implementor)
    @implementor = implementor
  end

  def task
    raise 'Should be implemented in a sub class'
  end
end

class RefinedAbstraction < Abstraction
  def apply_factor(factor)
    @factor = factor
  end

  def task
    "#{@factor} #{@implementor.operation}"
  end
end

class BridgePattern
  def self.main
    a_refined_abstraction = RefinedAbstraction.new(ConcreteImplementor.new)
    another_refined_abstraction = RefinedAbstraction.new(ConcreteImplementor.new)

    a_refined_abstraction.apply_factor('First task through')
    another_refined_abstraction.apply_factor('Second task through')

    [a_refined_abstraction, another_refined_abstraction].map(&:task)
  end
end
