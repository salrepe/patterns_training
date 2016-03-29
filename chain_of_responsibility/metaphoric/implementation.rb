class LineHandler
  def add_successor(successor)
    @successor = successor
  end
end

class HeaderHandler < LineHandler
  def handle(line)
    return @successor.handle(line) unless line.start_with?('01')

    Header.new
  end
end

class AccountHandler < LineHandler
  def handle(line)
    return @successor.handle(line) unless line.start_with?('15')

    Account.new
  end
end

class TransactionHandler < LineHandler
  def handle(line)
    raise 'Incorrect beginning of file number' unless line.start_with?('16')

    Transaction.new
  end
end

class Header; end
class Account; end
class Transaction; end

class Bai2Parser
  def self.parse(line)
    header_handler = HeaderHandler.new
    account_handler = AccountHandler.new
    transaction_handler = TransactionHandler.new

    header_handler.add_successor(account_handler)
    account_handler.add_successor(transaction_handler)

    header_handler.handle(line)
  end
end
