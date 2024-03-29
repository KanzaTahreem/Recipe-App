class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, class_name: 'Food', foreign_key: 'user_id'
  has_many :recipes, class_name: 'Recipe', foreign_key: 'user_id'

  validates :name, presence: true, length: { in: 2..250 }

  # fuction bnao admin ka
  def admin?
    role == 'admin'
  end
end
