require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品商品の保存' do
      context '商品が出品できる場合' do
        it '出品画像と商品名と商品の説明と販売価格があって、カテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数が1以外で、販売価格が半角数字300~9999999なら出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品出品ができない場合' do
        it '出品画像が空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では出品できない' do
          @item.product = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product can't be blank")
        end
        it '商品の説明が空では出品できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it '販売価格が空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'カテゴリーが1では出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品の状態が1では出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end
        it '配送料の負担が1では出品できない' do
          @item.postage_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Postage must be other than 1')
        end
        it '発送元の地域が1では出品できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end
        it '発送までの日数が1では出品できない' do
          @item.period_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Period must be other than 1')
        end
        it '販売価格が全角では出品できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '販売価格が半角英数字混合では登録できないこと' do
          @item.price = '1a1a1a'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '販売価格が半角英語だけでは登録できないこと' do
          @item.price = 'aaaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '販売価格が300~9999999以外では出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than 300')
        end
        it '販売価格が300~9999999以外では出品できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 9999999")
        end
        it 'ユーザーが紐づいていなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end
