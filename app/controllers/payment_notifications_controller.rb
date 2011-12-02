class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  
  def index
    @payment_notifications = PaymentNotification.all
  end
  
  def show
    @payment_notification = PaymentNotification.find(params[:id])
  end
 
  def create 
    PaymentNotification.create!(:params => params, :user_id => params[:invoice].chop, :status => params[:payment_status], :transaction_id => params[:txn_id], :product => params[:invoice].last(1) )
    render :nothing => true

  end
end
