class Pet < ActiveRecord::Base
    belongs_to :user
    enum type_pet: { squirtle: 0, bulbasur: 1, charmander: 2 }
end