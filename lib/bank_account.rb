class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
def initialize(name,status="open", balance=1000)
@name=name
@balance=balance
@status=status
end

def deposit(depo)
  @balance += depo
end

def display_balance
  "Your balance is $#{@balance}."
end

def valid?
  status=="open" && balance > 0
end

def close_account
  @status="closed"
end
end
