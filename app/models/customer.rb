class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :orders
         has_many :shipping_addresses
         has_many :products,through: :cart_product, source: :product, dependent: :destroy
         has_many :cart_products,dependent: :destroy
         

  def active_for_authentication?
    super && (is_deleted == false )
  end

end