class RegisterController < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__) #Para que encuentre al register correctamente cuando centralize con el register_controller
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