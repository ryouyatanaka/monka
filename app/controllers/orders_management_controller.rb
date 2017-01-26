class OrdersManagementController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:edit, :confirm_payment, :deliver, :cancel]

  def index
    @orders = Order.all
  end

  def confirm_payment
    respond_to do |format|
      if @order.confirm_payment!
        format.html { redirect_to orders_management_index_url, notice: 'Order was successfully updated.' }
        format.json { render :index, status: :ok, location: orders_management_index_path }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def deliver
    respond_to do |format|
      if @order.deliver!
        format.html { redirect_to orders_management_index_url, notice: 'Order was successfully updated' }
        format.json { render :index, status: :ok, location: orders_management_index_path }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    respond_to do |format|
      if @order.cancel!
        format.html { redirect_to orders_management_index_url, notice: 'Order was successfully updated' }
        format.json { render :index, status: :ok, location: orders_management_index_path }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
