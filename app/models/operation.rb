class Operation < ActiveRecord::Base
    belongs_to :account
    enum type_operation: { extraction: 0, deposite: 1, loan: 2}
end