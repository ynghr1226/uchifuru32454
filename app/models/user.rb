class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         with_options presence: true do
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/ } # 半角英数字のみ
          validates :name
      
          with_options format: { with: /\A[ぁ-ゔァ-ヴ一-龥]+\z/ } do # 全角のみ
            validates :last_name
            validates :first_name
          end
      
          
        end
      
        has_many :lessons
        has_many :orders

end

