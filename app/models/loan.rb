class Loan < Operation
    enum type_loan: { payed: 0, close_to_expiration: 1, expired: 2 }
end