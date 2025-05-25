class User < ActiveRecord::Base
    has_one :account
    has_many :pet
    has_many :card, through: :account

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :name, :lastname, :dni, :birth_date, :phone_number, presence: true
    #TODO: relación amigos
end
