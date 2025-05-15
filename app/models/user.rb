class User < ActiveRecord::Base
    has_one :account
    has_many :pets
    has_many :cards, through: :account

    #TODO: relación amigos 
end
