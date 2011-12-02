class AddProductToPaymentNotifications < ActiveRecord::Migration
  def change
    add_column :payment_notifications, :product, :string
  end
end
