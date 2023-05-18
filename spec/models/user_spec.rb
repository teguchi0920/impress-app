require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必須項目をすべて入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it '名前が空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'メールが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールは登録できない' do
        @user.save
        anather_user = FactoryBot.build(:user)
        anather_user.email = @user.email
        anather_user.valid?
        expect(anather_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールに@が含まれていないと登録できない' do
        @user.email = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字未満だと登録できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードと確認用パスワードが一致しないと登録できない' do
        @user.password = 'a11111'
        @user.password_confirmation = 'b11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end