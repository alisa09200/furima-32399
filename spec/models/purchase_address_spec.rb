require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.5
    end

    context '購入情報が保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingがなくても保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '購入情報が保存できない場合' do
      it 'postalcodeが空だと保存できないこと' do
        @purchase_address.postalcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode can't be blank")
      end
      it 'postalcodeがハイフンがないと保存できないこと' do
        @purchase_address.postalcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode is invalid")
      end
      it 'area_idが１では保存できないこと' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneにハイフンがあると保存できないこと' do
        @purchase_address.phone = '111-1111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが12桁以上だと保存できないこと' do
        @purchase_address.phone = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが英数混合では登録できないこと' do
        @purchase_address.phone = '1a1a1a1a1a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'tekenが空だと保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
