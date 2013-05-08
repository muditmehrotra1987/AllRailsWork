class Invit < ActiveRecord::Base
  
  #****************************Attributes***************
  attr_accessible :recipient_email, :sender_id, :sent_at, :token  
  
  #****************************Assotiation***************
  belongs_to :sender, :class_name => 'User'
  has_one :recipient, :class_name => 'User'
  
  #****************************Validations***************
  validates_presence_of :recipient_email
  validate :recipient_is_not_registered
  validate :sender_has_invits, :if => :sender
  
  #****************************Calling methods***************  
  before_create :generate_token
  before_create :decrement_sender_count, :if => :sender
  
  #****************************
  #     Method Definitions    #
  #****************************
private
  
  #****************************Method to check user is register or not***************
  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
  end
  
  #****************************Method to check user has invitation or not***************
  def sender_has_invits
    unless sender.invit_limit > 0
      errors.add_to_base 'You have reached your limit of invitations to send.'
    end
  end
  
  #****************************Method to generate token***************
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
  
  #****************************Method to decrement the limit of invitation left for single user***************  
  def decrement_sender_count
    sender.decrement! :invit_limit
  end

end