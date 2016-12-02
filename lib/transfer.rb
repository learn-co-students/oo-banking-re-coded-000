class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :transactions
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
    @transactions={}
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
    self.status="rejected"
    "Transaction rejected. Please check your account balance."
end
end
end
def reverse_transfer
  if self.transactions.key?(sender.name + "-to-" + receiver.name) then
  if self.sender.valid? && self.sender.balance >= self.amount then
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
    self.transactions[sender.name + "-to-" + receiver.name] = self.amount
end
end
end
end
