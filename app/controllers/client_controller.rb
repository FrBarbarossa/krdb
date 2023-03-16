class ClientController < ApplicationController
    def clientview
        @client = Client.all.reorder('id ASC')
        p "!!!!!!!!"
        p Time.now.strftime("%m/%d/%Y")
      end
    
    def clientcreate
    end

    def addclient
        @client = Client.new({ first_name: params[:first_name], surname: params[:surname], patronymic: params[:patronymic], birth_date: params[:birth_date], phone_number: params[:phone_number], passport_series: params[:passport_series], passport_number: params[:passport_number] })
        return unless @client.valid?
        @client.save
        redirect_to '/client'
    end

    def edclient
        @client = Client.find_by(id: params[:id])
        p @client
      end
    
      def confirmclient
        @client = Client.find_by(id: params[:id])
        @client.update({ first_name: params[:first_name], surname: params[:surname], patronymic: params[:patronymic], birth_date: params[:birth_date], phone_number: params[:phone_number], passport_series: params[:passport_series], passport_number: params[:passport_number] })
        redirect_to '/client'
      end
    
      def delclient
        Client.find_by(id: params[:id]).destroy
        redirect_to '/client'
      end
end
