class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

    validates :password,
              format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :nickname
    validates :family_name, :first_name,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'お名前は全角で入力してください' }
    validates :family_name_kana, :first_name_kana,
              format: { with: /\A[ァ-ヶー]+\z/, message: 'お名前は全角で入力してください' }
    validates :birthday
  end
end

