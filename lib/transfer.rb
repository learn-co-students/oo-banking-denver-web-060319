class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  
  def initialize sender, receiver, amount = 50, status = "pending"
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if self.status == "pending" && self.amount > 0 && self.sender.valid? && self.receiver.valid?
      true
    else false
    end
  end

  def execute_transaction
    if self.valid? && self.amount <= self.sender.balance && self.status == "pending"
      self.sender.balance = self.sender.balance - self.amount
      self.receiver.balance = self.receiver.balance + self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance = self.sender.balance + self.amount
      self.receiver.balance = self.receiver.balance - self.amount
      self.status = "reversed"
    end
  end

end