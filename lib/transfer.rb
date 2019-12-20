class Transfer
  # your code here
  attr_reader :sender, :receiver,:amount
  attr_accessor :status
  def initialize(send,rec,amnt)
    @sender = send
    @receiver = rec
    @amount = amnt
    @status = "pending"
  end
  def valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
    sender.deposit(-amount)
    receiver.deposit(amount)
    self.status = "complete"
    else
      self.status = "rejected"
    p"Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.deposit(-amount)
      self.status = "reversed"
    end
  end
end
