class Cards < ActiveRecord::Base
    belongs_to :account
    enum TCard: { debito: 0, credito: 1 }
end