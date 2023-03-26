require 'rails_helper'
RSpec.describe FurimaForm, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @furima_form = FactoryBot.build(:furima_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do

      it 'すべての入力事項が存在すれば登録できる' do
        expect(@furima_form).to be_valid
      end

      it 'user_id が空でなければ登録できる' do
        @furima_form.user_id = 1
        expect(@furima_form).to be_valid
      end

      it 'item_id が空でなければ登録できる' do
        @furima_form.item_id = 1
        expect(@furima_form).to be_valid
      end

      it '郵便番号が、3桁 - 4桁 で登録できる' do
        @furima_form.postcode = '123-1234'
        expect(@furima_form).to be_valid
      end

      it '都道府県が --- 以外かつ空でなければ登録できる' do
        @furima_form.shipping_area_id = 2
        expect(@furima_form).to be_valid
      end

      it '市町村区が空でなければ登録できる' do
        @furima_form.city = '大阪府'
        expect(@furima_form).to be_valid
      end

      it '番地が空でなければ登録できる' do
        @furima_form.city_number = '岸和田0724'
        expect(@furima_form).to be_valid
      end

      it '建物名が空でも登録できる' do
        @furima_form.building_name = nil
        expect(@furima_form).to be_valid
      end

      it '電話番号が11桁の半角英数字のみで登録できる' do
        @furima_form.phone_number = 19012341234
        expect(@furima_form).to be_valid
      end
    end

    context '商品購入できない場合' do

      it 'user_idが空では登録できない' do
        @furima_form.user_id = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @furima_form.item_id = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空だと登録できない' do
        @furima_form.postcode = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @furima_form.postcode = 1234567
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end

      it '都道府県が --- だと登録できない' do
        @furima_form.shipping_area_id = 1
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '都道府県が空だと登録できない' do
        @furima_form.shipping_area_id = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '市町村区が空だと登録できない' do
        @furima_form.city = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと登録できない' do
        @furima_form.city_number = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("City number can't be blank")
      end

      it '電話番号が空だと登録できない' do
        @furima_form.phone_number = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it '電話番号が12桁以上は登録できない' do
        @furima_form.phone_number = 190123412345
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が9桁以下は登録できない' do
        @furima_form.phone_number = 190123412
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @furima_form.phone_number = '1901234123a'
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @furima_form.token = nil
        @furima_form.valid?
        expect(@furima_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end