class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :transactions
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transactions ={}
  end
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  def execute_transaction
    if !self.transactions.key?(sender.name + "-to-" + receiver.name) then
      if self.sender.valid? && self.sender.balance >= self.amount then
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      self.transactions[sender.name + "-to-" + receiver.name] = self.amount
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  end
  def reverse_transfer
    if self.transactions.key?(sender.name + "-to-" + receiver.name) then
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
  else
    return "reversing isn't available"
  end
  end
end
