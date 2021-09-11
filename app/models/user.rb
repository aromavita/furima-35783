class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true
    validates :family_name, :first_name, :family_name_kana, :first_name_kana,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'お名前は全角で入力してください' }
    validates :birthday, presence: true
  end
end
