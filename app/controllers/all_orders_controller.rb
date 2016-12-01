class AllOrdersController < ApplicationController
  
  def home
  end

  def self.orders_call
    AllOrdersController.call_api
  		@orders['results'].each do |order|
  			@check = Order.find_by(:order_id => order['id'])
  			if @check.nil?
  				Order.create(:order_id => order['id'],:payment_transaction_id => order['payment_transaction_id'],:grand_total => order['grand_total'],:promo_id => order['promo_id'],:created_at => order['created_at'],:updated_at => order['updated_at'],:parent_order => order['parent_order'],:billing_address => order['billing_address'],:billing_country => order['billing_country'],:billing_city => order['billing_city'],:billing_zip_code => order['billing_zip_code'],:shipping_address => order['shipping_address'],:shipping_country => order['shipping_country'],:shipping_city => order['shipping_city'],:shipping_zip_code => order['shipping_zip_code'],:ship_to => order['ship_to'],:customer_id => order['customer_id'],:order_product_id => @id)
  			end
  		end
  end

  def orders
    if params[:action] == 'orders'
      AllOrdersController.orders_call
      redirect_to root_path
    end
  end

  def self.order_product_call
    AllOrdersController.call_api
  		@orders['results'].each do |order|
  			order['order_product'].each do |op|
  				@check = OrderProduct.find_by(:order_product_id => op['id'])
  					if @check.nil?
		  				OrderProduct.create(:order_product_id => op['id'],:order_id => op['order_id'],:quantity => op['quantity'],:total_price => op['total_price'],:created_at => op['created_at'],:updated_at => op['updated_at'],:product_id => op['product_id'])
            end
  			end
  	   end
  end

  def order_product
    if params[:action] == 'order_product'
      AllOrdersController.order_product_call
      redirect_to root_path
    end
  end

  def self.product_call
    AllOrdersController.call_api
      @orders['results'].each do |order|
        order['order_product'].each do |op|
            @check = Product.find_by(:product_id => op['product']['id'])
            if @check.nil?
                Product.create(:product_id => op['product']['id'],:sku => op['product']['sku'],:name => op['product']['name'],:description => op['product']['description'],:price => op['product']['price'],:category_id => op['product']['category_id'],:tags => op['product']['tags'],:created_at =>op['product']['created_at'],:updated_at => op['product']['updated_at'])
            end
        end
      end
  end

  def product
    if params[:action] == 'product'
      AllOrdersController.product_call
      redirect_to root_path
    end
  end

  def self.order_history_call
    AllOrdersController.call_api
      @orders['results'].each do |order|
        @check = OrderHistory.find_by(:order_history_id => order['order_history']['id'])
        if @check.nil?
            OrderHistory.create(:order_history_id => order['order_history']['id'],:order_id => order['order_history']['order_id'],:notify => order['order_history']['notify'],:created_at => order['order_history']['created_at'],:updated_at => order['order_history']['updated_at'] )
        end
      end
  end

  def order_history
    if params[:action] == 'order_history'
      AllOrdersController.order_history_call
      redirect_to root_path
    end
  end

  def self.order_list_call
      @orderProduct = OrderProduct.all
      @orderProduct.each do |op|
        @product_id = op['product_id']
        @product = Product.find_by(:product_id => @product_id)
          if @product.nil?

          else
            @check = OrderList.find_by(:order_number => op.order_product_id)
               if @check.nil?
                  OrderList.create(:order_number => op.order_product_id,:uid => op.id ,:sku => @product.sku ,:quantity => op.quantity,:status => 'Pending')
               end  
          end    
      end 
  end

  def order_list
    if params[:action] == 'order_list'
      AllOrdersController.order_list_call
    end
  end

  def self.order_extracted_call
    @orders = OrderList.all
      @orders.each do |order|
        @check = OrderListX.find_by(:order_number => order.order_number)
          if @check.nil?
              @count = order.quantity
              @count.times do
                OrderListX.create(:order_number => order.order_number,:uid => order.uid,:sku => order.sku ,:status => order.status)
              end
          else

          end
      end
  end

  def orders_extracted
    if params[:action] == 'orders_extracted'
      AllOrdersController.order_extracted_call
    end
  end

  def get_all
    if params[:action] == 'get_all'
      AllOrdersController.orders_call
      AllOrdersController.order_product_call
      AllOrdersController.product_call
      AllOrdersController.order_history_call
      AllOrdersController.order_list_call
      AllOrdersController.order_extracted_call
      redirect_to root_path
    end
  end

  def delete_all
  	if params[:action] == 'delete_all'
  		Order.all.delete_all
  		OrderProduct.all.delete_all
      Product.all.delete_all
      OrderHistory.all.delete_all
      OrderList.all.delete_all
      OrderListX.all.delete_all
  		redirect_to root_path
  	end
  end
  
  private

  def self.call_api
  	clnt = HTTPClient.new
  	api = clnt.get_content('http://139.162.14.57/api/all_orders')
  	@orders = JSON.parse(api)
  end

end
