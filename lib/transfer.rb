require 'pry'


class Transfer

  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end


  def execute_transaction
    vaild_transfer = @sender.valid? && @sender.balance >= @amount
    if vaild_transfer && @status == "pending"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    elsif !vaild_transfer
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer 
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
