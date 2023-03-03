require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべての入力事項が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'last_nameが、漢字、カタカナ、ひらがなであれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end

      it 'first_nameが、漢字、カタカナ、ひらがなであれば登録できる' do
        @user.first_name = '隆太郎'
        expect(@user).to be_valid
      end

      it 'last_name_kanaが、カタカナであれば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end

      it 'first_name_kanaが、カタカナであれば登録できる' do
        @user.first_name_kana = 'リクタロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録出来ない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが漢字、カタカナ、ひらがなでないと登録出来ない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが漢字、カタカナ、ひらがなでないと登録出来ない' do
        @user.first_name = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_name_kanaがカタカナでないと登録出来ない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_name_kanaがカタカナでないと登録出来ない' do
        @user.first_name_kana = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'birthが空では登録出来ない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end

