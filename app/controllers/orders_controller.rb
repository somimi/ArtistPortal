class OrdersController < ApplicationController
  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @fees = Fee.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new
    @order.artist = current_user.artist
    @order.status = Order::UNPAID

    unless @order.save
      format.html { render action: "new" }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end

    params[:fee_ids].each do |fee_id|
      @order.order_items.build(:fee_id => fee_id.to_i)
    end
    @order.save

    token = params[:stripe_card_token]
    charge = Stripe::Charge.create(:amount => @order.total * 100,
                                   :currency => "usd",
                                   :card => token,
                                   :description => "TODO")

    if charge.paid
      @order.status = Order::PAID
      @order.save
      redirect_to pages_home_path, notice: 'Order was successfully created.'
    else
      flash[:errors] = "There was an error charging the card"
      # TODO elaborate on the errors
      render action: "new"
    end
  end
end
