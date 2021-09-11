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
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
      end

      it '重複したメールアドレスがある場合は登録できない' do
        @user.save
        aonther_user = FactoryBot.build(:user)
        aonther_user.email = @user.email
        aonther_user.valid?
      end

      it 'パスワードが５文字以下では登録できない' do
        @user.password = 'abc12'
        @user.valid?
      end

      it 'パスワードが数字だけだった場合は登録できない' do
        @user.password = '000000'
        @user.valid?
      end

      it 'パスワードが英字だけだった場合は登録できない' do
        @user.password = 'aaabbb'
        @user.valid?
      end

      it 'パスワードとパスワード(確認)が異なっている場合は登録できない' do
        
      end

      it 'お名前は全角でないと登録できない' do
        
      end

      it '生年月日が空欄の場合は登録できない' do
        @user.birthday = ''
        @user.valid?
      end

      it '' do
        
      end



    end
  end
end