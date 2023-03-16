class WarehouseController < ApplicationController
    def whlogview
        @whlog = Warehouselog.limit(500).reorder("id ASC")
    end

    def whlogcreate
        @product = Product.all.reorder("id ASC")
    end

    def addwhlog
        @whlog = Warehouselog.new({ product_id: params[:product_id], type: "supply", quantity_change: params[:quantity_change], amount: params[:amount], date: Time.now(), purchase_id: 6 })
        return unless @whlog.valid?
        @whlog.save
        redirect_to '/whlog'
    end
end
