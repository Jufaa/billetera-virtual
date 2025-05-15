class Pets < ActiveRecord::Base
    belongs_to :user
    enum TPet: { squirtle: 0, bulbasur: 1, charmander: 2 }
end