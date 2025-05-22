class Card < ActiveRecord::Base
    belongs_to :account
    enum type_card: { debit: 0, credit: 1 }
end