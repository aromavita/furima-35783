require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ニックネーム、メールアドレス、パスワード、お名前、お名前(カナ)、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end



    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスがある場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'パスワードが５文字以下では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが数字だけだった場合は登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'パスワードが英字だけだった場合は登録できない' do
        @user.password = 'aaabbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'passwordが全角のみだと登録できない' do
        @user.password = "Ａ１２３４５６７８９"
        @user.password_confirmation = "Ａ１２３４５６７８９"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'お名前は全角でないと登録できない' do
        @user.family_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name お名前は全角で入力してください')
      end

      it '生年月日が空欄の場合は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end


      it 'パスワードとパスワード確認用が不一致だと登録できない' do
        @user.password = "a12345678"
        @user.password_confirmation = 'b12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameに半角文字が含めれていると登録できない' do
        @user.family_name = "ﾀｶﾊｼ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name お名前は全角で入力してください")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameは半角文字が含めれていると登録できない' do
        @user.first_name = "ﾕｳｽｹ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name お名前は全角で入力してください")
      end

      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaにカタカナ以外の文字が含めれていると登録できない' do
        @user.family_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana お名前は全角で入力してください")
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_にカタカナ以外の文字が含まれていると登録できない' do
        @user.first_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana お名前は全角で入力してください")
      end
    end
  end
end
