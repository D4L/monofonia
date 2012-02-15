require 'digest/sha1'

class User < ActiveRecord::Base
  validates_length_of :username, :within => 3..40
  validates_length_of :pass, :within => 5..40
  validates_presence_of :username, :pass, :salt
  validates_uniqueness_of :username

  attr_protected :id, :salt

  attr_accessor :pass

  has_and_belongs_to_many :groups

  def pass=(pass)
    @pass=pass
    self.salt = User.random_string(10) if !self.salt?
    self.password = User.encrypt(@pass, self.salt)
  end

  def self.authenticate(username, pass)
    u = find(:first, :conditions => ["username = ?", username])
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt) == u.password
  end

  def self.random_string(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) do |i|
      newpass << chars[rand(chars.size-1)]
    end
    return newpass
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end

end
