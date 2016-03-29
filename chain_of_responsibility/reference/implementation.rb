class Handler
  def add_successor(successor)
    @successor = successor
  end

  def handle(request)
    raise 'Should be implemented in a sub class'
  end
end

class FirstConcreteHandler < Handler
  def handle(request)
    return @successor.handle(request) unless request > 0

    "FirstConcreteHandler handled request #{request}"
  end
end

class SecondConcreteHandler < Handler
  def handle(request)
    return @successor.handle(request) unless request == 0

    "SecondConcreteHandler handled request #{request}"
  end
end

class ThirdConcreteHandler < Handler
  def handle(request)
    "ThirdConcreteHandler handled request #{request}"
  end
end
