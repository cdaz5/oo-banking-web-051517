require 'pry'
class Transfer

attr_accessor :sender, :receiver, :amount, :status

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  if sender.valid? == true && receiver.valid? == true
    true
  else
    false
  end
end

def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.sender.status = "complete"
    self.receiver.status = "complete"
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if execute_transaction
  sender.balance += self.amount
  receiver.balance -= self.amount
  self.sender.status = "reversed"
  self.receiver.status = "reversed"
  self.status = "reversed"
  # binding.pry
end
end





end ### END OF TRANSFER CLASS ###
