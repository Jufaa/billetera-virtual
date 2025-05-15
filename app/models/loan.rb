class Loan < Operation
    enum TLoanState: { pagado: 0, por_vencer: 1, vencido: 2 }
end