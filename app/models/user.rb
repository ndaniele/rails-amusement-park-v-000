class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if self.happiness.to_i > self.nausea.to_i
      "happy"
    elsif 
      self.nausea.to_i > self.happiness.to_i
      "sad"
    end
  end

end
