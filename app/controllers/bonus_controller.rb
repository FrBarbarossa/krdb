class BonusController < ApplicationController
    def cardview
        @card = Bonuscard.all().reorder("id ASC")
    end

    def linkcard
        @card = Bonuscard.new({ client_id: params[:id], balance: 0, creation_date: Time.now.strftime("%d/%m/%Y") })
        return unless @card.valid?
        @card.save
        redirect_to '/client'
    end

    def bonuslogview
        @blog = Bonuslog.all().reorder("id ASC")
    end
end
