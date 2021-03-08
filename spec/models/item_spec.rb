require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '投稿できるとき' do
      it 'image,item_name,item_description,category_id,item_status_id,shipping_cost_burden_id,shipping_area_id,delivery_days_id,priceがあれば登録できる' do
        expect(@item).to be_valid
      end

      it '販売価格は、¥300~¥9999999の間であれば登録できる' do
        @item.price = 50000
        expect(@item).to be_valid
      end

      it '販売価格は半角数字であれば登録できる' do
        @item.price = 50000
        expect(@item).to be_valid
      end

    end

    context '投稿できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'item_status_idが空では登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status Select")
      end

      it 'shipping_cost_burden_idが空では登録できない' do
        @item.shipping_cost_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost burden Select")
      end

      it 'shipping_area_idが空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area Select")
      end

      it 'delivery_days_idが空では登録できない' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days Select")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は、¥300~¥9999999の間でなければ登録できない' do
        @item.price = '200', '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it '販売価格は半角数字でなければ登録できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end


  end
end
