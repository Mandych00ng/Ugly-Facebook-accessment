get '/login/user' do
	erb :"static/index"
end

get '/signup' do
	erb :'static/sign_up'
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		@msg = "Hey Mate! welcome!Pls login"
		@user = User.all
		erb :"static/index"
	else
		@msg = "Try try again"
		@user = User.all
		erb :"static/index"
	end
end


post '/login' do
	@user = User.find_by(email: params[:user][:email])
	if @user 
		if @user.authenticate(params[:user][:password])
			log_in(@user)
			redirect '/home'
		else
			@msg = "Wrong email or password"
		end
	end
end

get '/logout' do
	log_out
	redirect '/'
end