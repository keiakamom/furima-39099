require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @order_payment = FactoryBot.build(:order_payment)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@order_payment).to be_valid
      end
      it 'Buildingは空でも登録できる' do
        @order_payment.building = nil
        expect(@order_payment).to be_valid
      end
    end
    context '配送先情報の保存ができないとき' do
      it 'user_idが紐づいていないと登録できない' do
        @order_payment.user_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが紐づいていないと登録できない' do
        @order_payment.item_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Item can't be blank"
      end
      it 'postcodeが空では登録できない' do
        @order_payment.postcode = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Postcode can't be blank"
      end
      it 'postcodeにハイフンがないと登録できない' do
        @order_payment.postcode = 1234567
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
      end
      it 'prefecture_idが空では登録できない' do
        @order_payment.prefecture_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では登録できない' do
        @order_payment.city = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "City can't be blank"
      end
      it 'Adressesが空では登録できない' do
        @order_payment.adresses = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Adresses can't be blank"
      end
      it 'Phone_numberが空では登録できない' do
        @order_payment.phone_number = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'Phone_numberが空では登録できない' do
        @order_payment.phone_number = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'Phone_numberは半角数字以外では登録できない' do
        @order_payment.phone_number = "０90-0000-0000"
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Phone number is invalid"
      end
      it 'Phone_numberは10桁以下では登録できない' do
        @order_payment.phone_number = "0123456789"
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Phone number is invalid"
      end
      it 'Phone_numberは12桁以上では登録できない' do
        @order_payment.phone_number = "0901234567890"
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include "Phone number is invalid"
      end
      it "tokenが空では登録できないこと" do
        @order_payment.token = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
    end

  end 
end 