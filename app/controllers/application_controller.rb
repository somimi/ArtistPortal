class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :paypal

  def paypal
    @paypal = Paypal.new
  end
end
