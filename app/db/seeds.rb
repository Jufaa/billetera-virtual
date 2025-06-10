users = [
  {name: 'Lucas', lastname: 'Chiapella', dni:'45090618',birth_date:'2019-12-11',email:'lucas@gmail.com',phone_number:'3541234', password: 'lucas123'},
  {name: 'Santiago', lastname: 'Amaya', dni:'45090619',birth_date:'2020-01-14',email:'santiago@gmail.com',phone_number:'36463558', password: 'santiago123'},
  {name: 'Juan', lastname: 'Francitorra', dni:'45090620',birth_date:'2023-12-05',email:'juan@gmail.com',phone_number:'37134758', password: 'juan123'},
  {name: 'Ignacio', lastname: 'Cerutti', dni:'45090621',birth_date:'2023-12-04',email:'igna@gmail.com',phone_number:'37134753', password: 'ignacio123'},
  {name: 'Sebastian', lastname: 'Ammann', dni:'45090630',birth_date:'2023-12-02',email:'seba@gmail.com',phone_number:'37134756', password: 'seba123'}
]
users.each do |u|
  user = User.create(u)
  user.save

  account = user.create_account(
    cvu: "000000000000000#{user.id.to_s.rjust(4, '0')}",
    account_alias:"#{user.name.downcase}.#{user.lastname.downcase}.rupay",
    balance:"4000"
  )
end
