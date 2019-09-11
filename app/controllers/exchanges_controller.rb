class ExchangesController < ApplicationController
    before_action :set_exchange [:show]


    private

    def set_exchange
        @exchange = Exchange.find(params[:id])
    end

    def exchange_params
        params.require(:exchange).permit(
            :
        )
    end

end
