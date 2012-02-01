class PaymentNotification < ActiveRecord::Base
  belongs_to :user
  serialize :params
  after_create :payment_accepted
  attr_accessible :params, :user_id, :status, :transaction_id, :product
  
  private
  
  def payment_accepted
    if status == "Completed" && params[:secret] == APP_CONFIG[:paypal_secret]
      if product == 1
        user.artist.update_attribute(:visual_paid, true)
      elsif product == 2
        user.artist.update_attribute(:literary_paid, true)
      elsif product == 3
        user.artist.update_attribute(:installation_paid, true)
      else product == 4
        user.artist.update_attribute(:film_paid, true)
      end
    end
  end

end
