class SellerController < ApplicationController
    def sellerview
        @seller = Seller.all.reorder('id ASC')
        p "!!!!!!!!"
        p Time.now.strftime("%m/%d/%Y")
      end

      def sellercreate
      end
  
      def addseller
          @seller = Seller.new({ first_name: params[:first_name], surname: params[:surname], patronymic: params[:patronymic], birth_date: params[:birth_date], phone_number: params[:phone_number], passport_series: params[:passport_series], passport_number: params[:passport_number], salary: params[:salary], hiring_date: params[:hiring_date], disimiss_date: params[:disimiss_date] })
          return unless @seller.valid?
          @seller.save
          redirect_to '/seller'
      end
  
      def edseller
          @seller = Seller.find_by(id: params[:id])
          p @seller
        end
      
        def confirmseller
          @seller = Seller.find_by(id: params[:id])
          @seller.update({ first_name: params[:first_name], surname: params[:surname], patronymic: params[:patronymic], birth_date: params[:birth_date], phone_number: params[:phone_number], passport_series: params[:passport_series], passport_number: params[:passport_number], salary: params[:salary], hiring_date: params[:hiring_date], disimiss_date: params[:disimiss_date] })
          redirect_to '/seller'
        end
      
        def delseller
          Seller.find_by(id: params[:id]).destroy
          redirect_to '/seller'
        end
end
