class User < ActiveRecord::Base
  has_one :artist
  validates_presence_of :email, :password, :role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :paid_visual, :paid_literary, :juror
  

  
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
  
  def is_film_admin?
    role == "film admin"
  end
  
  def is_literary_admin?
    role == "literary admin"
  end
  
  def is_performance_admin?
    role == "performance admin"
  end
  
  def is_installation_admin?
    role == "installation admin"
  end
  
  def is_invited?
    role == "invited artist"
  end
  

  def paypal_visual_encrypted(return_url, notify_url)

    values = {
      :business => 'director@sexpositiveculture.org',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id.to_s.concat("1").to_i,
      :notify_url => notify_url,
      :cert_id => APP_CONFIG[:paypal_cert_id]
    }
    
    values.merge!({
      "amount_#{1}" => "30",
      "item_name_#{1}" => "Visual Submission Fee",
      "item_number_#{1}" => "1",
      "quantity_#{1}" => "1"
    })
    
    encrypt_for_paypal(values)
  end
  
  def paypal_literary_encrypted(return_url, notify_url)
    values = {
      :business => 'director@sexpositiveculture.org',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id.to_s.concat("2").to_i,
      :notify_url => notify_url,
      :cert_id => APP_CONFIG[:paypal_cert_id]
    }
    
    values.merge!({
      "amount_1" => "30",
      "item_name_1" => "Literary Submission Fee",
      "item_number_1" => "2",
      "quantity_1" => "1"
    })
    
    encrypt_for_paypal(values)
  end
  
  def paypal_installation_encrypted(return_url, notify_url)
    values = {
      :business => 'director@sexpositiveculture.org',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id.to_s.concat("3").to_i,
      :notify_url => notify_url,
      :cert_id => APP_CONFIG[:paypal_cert_id]
    }
    
    values.merge!({
      "amount_1" => "30",
      "item_name_1" => "Installation Submission Fee",
      "item_number_1" => "3",
      "quantity_1" => "1"
    })
    
    encrypt_for_paypal(values)
  end
  
  def paypal_film_encrypted(return_url, notify_url)
    values = {
      :business => 'director@sexpositiveculture.org',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id.to_s.concat("4").to_i,
      :notify_url => notify_url,
      :cert_id => APP_CONFIG[:paypal_cert_id]
    }
    
    values.merge!({
      "amount_1" => "10",
      "item_name_1" => "Video/Short Film Submission Fee",
      "item_number_1" => "4",
      "quantity_1" => "1"
    })
    
    encrypt_for_paypal(values)
  end
  
  def paypal_store_encrypted(return_url, notify_url)

    values = {
      :business => 'director@sexpositiveculture.org',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id.to_s.concat("5").to_i,
      :notify_url => notify_url,
      :cert_id => APP_CONFIG[:paypal_cert_id]
    }
    
    values.merge!({
      "amount_#{1}" => "30",
      "item_name_#{1}" => "Store Submission Fee",
      "item_number_#{1}" => "5",
      "quantity_#{1}" => "1"
    })
    
    encrypt_for_paypal(values)
  end
  
  
  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end

end
