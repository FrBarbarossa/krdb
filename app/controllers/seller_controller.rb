class SellerController < ApplicationController
    def sellerview
        @seller = Seller.all.reorder('id ASC')
        p "!!!!!!!!"
        p Time.now.strftime("%m/%d/%Y")
      end
end
