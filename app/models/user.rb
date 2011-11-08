class User < ActiveRecord::Base
  has_one :artist

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :paid_visual, :paid_literary
  
  def is_admin?
    role == "admin"
  end
  
  def is_juror?
    role == "juror"
  end
  
  def is_handler?
    role == "handler"
  end
  
  def is_artist?
    role == "artist"
  end

end
