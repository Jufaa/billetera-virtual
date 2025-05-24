users = [
  {name: 'Ignacio', lastname: 'Cerutti Norris', dni:'44295165',birth_date:'2002-11-18',email:'ignaciocerutti@hotmail.com.ar',phone_number:'45824342', password: 'bokita'},
  {name: 'Franco', lastname: 'Machuca', dni:'45600311',birth_date:'2003-07-15',email:'franco@hotmail.com.ar',phone_number:'34435436342', password: 'juen'},
  {name: 'Valentino', lastname: 'Natali', dni:'44345665',birth_date:'2003-05-17',email:'valentino@hotmail.com.ar',phone_number:'4234234409', password: 'sevineeboke'}
]
users.each do |u|
  user = User.create(u)
  user.save
  user.update(cvu:"000000000000000#{user.id.to_s.rjust(4, '0')}", alias:"#{user.name.downcase}.#{user.lastname.downcase}.rupay",money_balance:"4000")
end