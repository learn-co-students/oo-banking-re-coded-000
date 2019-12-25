class Transfer
  # your code here
  attr_accessor :sender,:receiver,:amount,:status
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
    @transactions={}
  end
  def valid?
    sender.valid? ==true && receiver.valid? ==true ? true : false
  end
  def execute_transaction
    if !@transactions.key?(sender.name + "-to-" + receiver.name)
      if self.sender.valid? && sender.balance >= self.amount
       sender.balance=sender.balance - self.amount
       receiver.balance=receiver.balance + self.amount
       self.status="complete"
       @transactions[sender.name + "-to-" + receiver.name] = self.amount
       self.status
      else
      self.status="rejected"
      return "Transaction rejected. Please check your account balance."
  end
end
end
def reverse_transfer
  if @transactions.key?(sender.name + "-to-" + receiver.name)
    if self.sender.valid? && self.receiver.valid? && receiver.balance >= @transactions[sender.name + "-to-" + receiver.name]
      sender.balance=sender.balance + self.amount
      receiver.balance=receiver.balance - self.amount
      self.status="reversed"
    else
      return "can not reverse transaction."
    end
  end

end
end
