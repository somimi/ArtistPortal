class PaymentNotification < ActiveRecord::Base
  belongs_to :user
  serialize :params
  after_create :payment_accepted
  attr_accessible :params, :user_id, :status, :transaction_id, :product
  
  private
  
  def payment_accepted
    if status == "Completed"
      if product == "1"
        user.artist.update_attribute(:visual_paid, true)
      elsif product == "2"
        user.artist.update_attribute(:literary_paid, true)
      elsif product == "3"
        user.artist.update_attribute(:installation_paid, true)
      elsif product == "4"
        user.artist.update_attribute(:film_paid, true)
      elsif product == '5'
        user.artist.update_attribute(:store_paid, true)
      end
    end
  end

end
