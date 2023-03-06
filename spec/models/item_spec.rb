require 'rails_helper'
RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'すべての入力事項が存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'category_idが[---]以外だと登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it 'condition_idが[---]以外だと登録できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end

      it 'delivery_charge__idが[---]以外だと登録できる' do
        @item.delivery_charge_id = 2
        expect(@item).to be_valid
      end

      it 'shipping_area_idが[---]以外だと登録できる' do
        @item.shipping_area_id = 2
        expect(@item).to be_valid
      end

      it 'shipping_day_idが[---]以外だと登録できる' do
        @item.shipping_day_id = 2
        expect(@item).to be_valid
      end

      it 'priceが300円〜9,999,999円の間だと登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do

      it 'imageが空では登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では登録出来ない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'textが空では登録出来ない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idが[---]だと登録出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが[---]だと登録出来ない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'delivery_charege_idが[---]だと登録出来ない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it 'shipping_area_idが[---]だと登録出来ない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'shipping_day_idが[---]だと登録出来ない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'priceが空は登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円以下は登録出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9,999,999円以上は登録出来ない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
