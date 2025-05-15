class RegisterController < Sinastra::Base
  get '/register' do
    erb :register
  end

  post '/register' do
    @user = User.new(params[:user])
    if @user.save
      redirect to('/login')
    else
      erb :register
    end
  end
end