class User < ActiveRecord::Base
  
  #****************************Attributes***************#
  attr_accessible :email, :name, :password_hash, :password_salt, :username, :password_confirmation, :password, :invit_token, :address, :phonenumber, :companytype, :registrationid 
  attr_accessor :password   
   
  #****************************Validations***************#
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :registrationid
  validates_presence_of :companytype
  validates_presence_of :address
  validates_presence_of :phonenumber
  validates_presence_of :username
  validates_presence_of :password, :on => "create"
  validates_presence_of :invit_id, :message => 'is required'
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_uniqueness_of :invit_id
  validates_uniqueness_of :registrationid
  validates_confirmation_of :password
  
  #****************************Assotiation***************#
  has_many :sent_invits, :class_name => 'Invit', :foreign_key => 'sender_id'
  belongs_to :invit
  
  #****************************Calling methods***************#  
  before_create :set_invit_limit
  before_save :encrypt_password
  
  #***************************#
  #   Method Definitions      #
  #***************************#
  
  #****************************Method to encrypt password***************#
   def encrypt_password  
    if password.present?  
      self.password_salt = BCrypt::Engine.generate_salt  
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
    end  
   end  
   
  #****************************Method to authenticate username & password***************#
  def self.authenticate(username, password)  
    user = find_by_username(username)  
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)  
      user  
    else  
      nil  
    end  
  end
  
  #****************************Method to find token for user***************#
  def invit_token
    invit.token if invit
  end
  
  def invit_token=(token)
    self.invit = Invit.find_by_token(token)
  end
  
private
  #****************************Method to set invitation limit(optional) curntly not implemented***************#
  def set_invit_limit
    self.invit_limit = 5
  end

end