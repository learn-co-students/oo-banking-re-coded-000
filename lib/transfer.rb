class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
end
def valid?
  self.sender.valid? && self.receiver.valid?
end
def execute_transaction
  if sender.valid? && receiver.valid? && sender.balance > amount && self.status == "pending"
    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.status = "complete"
  else
    self.status="rejected"
    "Transaction rejected. Please check your account balance."
end
end
def reverse_transfer
  if sender.valid? && receiver.valid? && receiver.balance > amount && self.status == "complete"
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
  else
    self.status="rejected"
    "Transaction rejected. Please check your account balance."
end
end
end
