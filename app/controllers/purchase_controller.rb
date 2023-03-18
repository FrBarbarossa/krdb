class PurchaseController < ApplicationController
    def purchaseview
        @purchase = Purchase.limit(500).reorder('id ASC')
    end

    def purchasecreate
        @client = Client.all().reorder('id ASC')
        @seller = Seller.all().reorder('id ASC')
        @product = Product.all().reorder('id ASC')
    end

    def addpurchase
        @purchase = Purchase.create!({seller_id: params[:seller_id], client_id: params[:client_id], bonus_amount: params[:bonus_amount], cash_amount: params[:cash_amount], date: Time.now()})
        @bc = Bonuscard.find_by(client_id: params[:client_id])
        @bc.update(balance: @bc.balance - params[:bonus_amount].to_i)
        params[:product_id].each{|prod| Warehouselog.create!({ product_id: params[:product_id], type: "sale", quantity_change: -1, amount: params[:cash_amount], date: Time.now(), purchase_id: @purchase.id })}
        redirect_to '/purchase'
    end
end
