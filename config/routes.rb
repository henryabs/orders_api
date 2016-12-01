Rails.application.routes.draw do
  get 'orders' => 'all_orders#orders'
  get 'order_product' => 'all_orders#order_product'
  get 'product' => 'all_orders#product'
  get 'order_history' => 'all_orders#order_history'
  get 'order_list' => 'all_orders#order_list'
  get 'orders_extracted' => 'all_orders#orders_extracted'
  get 'get_all' => 'all_orders#get_all'
  get 'delete_all' => 'all_orders#delete_all'

  root 'all_orders#home'

  
end
