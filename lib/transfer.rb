require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  @@all = []

  def initialize(sender, receiver, amount, status="pending")
    @status = status
    @sender = sender
    @receiver = receiver
    @amount = amount
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else false
    end
  end

  def execute_transaction
    if self.status == ("complete" || "rejected")
      return "Transaction rejected. Please check your account balance."
    elsif sender.balance < amount || !valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
