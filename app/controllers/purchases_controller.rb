class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @purchase_address.save
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postalcode, :area_id, :city, :block, :building, :phone)
  end

end
