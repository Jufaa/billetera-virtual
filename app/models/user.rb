class User < ActiveRecord::Base
    has_one :account
    has_many :pet
    has_many :card, through: :account
    has many :user

    #TODO: relación amigos 
end
