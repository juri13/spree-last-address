require 'find_address'

CheckoutController.class_eval do

  private

  def before_address
    #puts "BEFORE ADDRESS2 called user= #{@order}  #{@order.email}"
    @order.bill_address , @order.ship_address = FindAddressHelper.find_address(@order.email)
    # in case none found
    @order.bill_address ||= Address.new(:country_id => 214)
    @order.ship_address ||= Address.new(:country_id => 214)
  end


end
