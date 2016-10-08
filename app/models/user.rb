class User < ApplicationRecord

  attr_accessor :email, :password, :confirmed

  def self.authenticate(_email="", _password="")
    user = User.find_by(email: _email)
    if user && user.match_password(_password) && user.confirmed
      return user
    else
      return false
    end
  end

  def match_password(_password="")
    password == Digest::MD5.hexdigest(_password)
  end

end
