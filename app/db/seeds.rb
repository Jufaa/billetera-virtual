users = [
  {name: 'Aphelios', lastname: 'Targon', dni:'45090618',birth_date:'2019-12-11',email:'design@riot.com',phone_number:'3541234', password: 'collector'},
  {name: 'Sett', lastname: 'Jonia', dni:'45090619',birth_date:'2020-01-14',email:'w@riot.com',phone_number:'36463558', password: 'truedamage'},
  {name: 'Hwei', lastname: 'Twink', dni:'45090620',birth_date:'2023-12-05',email:'mechanics@riot.com',phone_number:'37134756', password: 'teclas'}
]
users.each do |u|
  user = User.create(u)
  user.save

  account = user.create_account(
    cvu: "000000000000000#{user.id.to_s.rjust(4, '0')}",
    alias:"#{user.name.downcase}.#{user.lastname.downcase}.rupay",
    balance:"4000"
  )
end