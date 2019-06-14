require 'pry'

class BankAccount
    attr_reader :name
    attr_accessor :status, :balance
  
    @@all = []
  
    def initialize(name, balance=1000, status="open")
      @name = name
      @status = status
      @balance = balance
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def deposit(deposit)
        self.balance += deposit
    end
  
    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            true
        else false
        end
    end

    def close_account
        self.status = "closed"
    end

end
