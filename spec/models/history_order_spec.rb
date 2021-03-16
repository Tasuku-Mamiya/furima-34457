require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @history_order = FactoryBot.build(:history_order, item_id: @item.id, user_id: @user.id)
      sleep 0.1
    end

    context '購入できるとき' do
      it 'item_id, user_id, token, postal_code, shipping_area_id, city, address_line, phone_numberがあれば購入できる' do
        expect(@history_order).to be_valid
      end
    end

    context '購入できないとき' do
      it 'item_idが空では購入できない' do
        @history_order.item_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では購入できない' do
        @history_order.user_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では購入できない' do
        @history_order.token = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @history_order.postal_code = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Postal code can't be blank")
      end

      
      it '郵便番号の保存にはハイフンが必要であること' do
        @history_order.postal_code = 1123454
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'shipping_area_idが空では購入できない' do
        @history_order.shipping_area_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Shipping area Select")
      end

      it 'shipping_area_idが0では購入できない' do
        @history_order.shipping_area_id = 0
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Shipping area Select")
      end

      it 'cityが空では購入できない' do
        @history_order.city = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("City can't be blank")
      end

      it 'address_lineが空では購入できない' do
        @history_order.address_line = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Address line can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @history_order.phone_number = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは11桁以内の数値のみ保存可能なこと' do
        @history_order.phone_number = '111222333444555'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
