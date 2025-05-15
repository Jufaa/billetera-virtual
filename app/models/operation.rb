class Operation < ActiveRecord::Base
    belongs_to :account
    enum TOperation: { retiro: 0, recarga: 1, reembolso: 2, cargos: 3 }
end