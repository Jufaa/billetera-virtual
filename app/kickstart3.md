# Bcryp, RSpec & Views

### Install and use BCrypt

add bcrypt to your Gemfile and run the migration to add the columns to the users table.

```ruby
gem 'bcrypt', '~> 3.1.7'
```

```sh
bundle exec rake db:create_migration add_columns_to_users
```

```ruby
class AddColumnsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end
end
```

Update the model to use `has_secure_password` and add validations for the email and name fields.

```
class User < ActiveRecord::Base
  has_secure_password

  has_one :account

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
```

### Create the views

Create the views for the signup and login forms. Use ERB to create the views and include a layout file.

/views/layout.erb

```HTML
<!DOCTYPE html>
<html>
<head>
  <title>My Sinatra App</title>
</head>
<body>
  <header>
    <h1>Sinatra Auth Example</h1>
    <nav>
      <a href="/signup">Sign Up</a> |
      <a href="/login">Login</a>
    </nav>
    <hr>
  </header>

  <% if @error %>
    <p style="color: red;"><%= @error %></p>
  <% end %>

  <%= yield %>
</body>
</html>
```

/views/signup.erb

```HTML
<h2>Sign Up</h2>
<form action="/signup" method="post">
  <label>Name:</label><br>
  <input type="text" name="name" required><br>

  <label>Email:</label><br>
  <input type="email" name="email" required><br>

  <label>Password:</label><br>
  <input type="password" name="password" required><br><br>

  <button type="submit">Sign Up</button>
</form>
```

#/views/login.erb

```HTML
<h2>Login</h2>
<form action="/login" method="post">
  <label>Email:</label><br>
  <input type="email" name="email" required><br>

  <label>Password:</label><br>
  <input type="password" name="password" required><br><br>

  <button type="submit">Login</button>
</form>
```

#/views/welcome.erb

```HTML
<h2>Welcome, <%= @user.name %>!</h2>
<p>You are now logged in.</p>
```

### RSpec

Add RSpec to your Gemfile and create a spec helper file.

```ruby
group :test, :development do
  gem 'rspec'
  gem 'rack-test'
end
```

```sh
bundle exec rspec --init
```

```ruby
# spec/spec_helper.rb
require 'yaml'
require 'active_record'

require_relative '../server'

ENV['RACK_ENV'] ||= 'test'

db_config = YAML.load_file(File.expand_path('../../config/database.yml', __FILE__), aliases: true)
ActiveRecord::Base.establish_connection(db_config[ENV['RACK_ENV']])
```

```ruby
#  spec/models/transaction_spec.rb
require_relative '../spec_helper'

RSpec.describe Transaction do
  let(:source_account) { Account.create!(balance: 100.0) }
  let(:target_account) { Account.create!(balance: 50.0) }

  context 'validations' do
    it 'no permite crear transacción si no hay saldo suficiente' do
      transaction = Transaction.new(
        source_account: source_account,
        target_account: target_account,
        amount: 150.0
      )
      expect(transaction).not_to be_valid
      expect(transaction.errors[:base]).to include("No hay saldo suficiente en la cuenta origen para esta transacción")
    end

    it 'permite crear transacción si hay saldo suficiente' do
      transaction = Transaction.new(
        source_account: source_account,
        target_account: target_account,
        amount: 50.0
      )
      expect(transaction).to be_valid
    end
  end

  context 'after create callback' do
    it 'debita y acredita los balances correctamente' do
      transaction = Transaction.create!(
        source_account: source_account,
        target_account: target_account,
        amount: 40.0
      )

      expect(source_account.reload.balance).to eq(60.0)
      expect(target_account.reload.balance).to eq(90.0)
    end
  end
end
```

## References

- [BCrypt Gem](https://github.com/bcrypt-ruby/bcrypt-ruby)
- [has_secure_password](https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password)
- [RSpec](https://github.com/rspec/rspec)
