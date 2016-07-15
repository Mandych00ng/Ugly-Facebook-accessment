require 'byebug'
get '/' do
  erb :"static/index"
end

get '/home' do
	if logged_in?
		erb :"static/home"	
	else
		redirect '/?error=1'
	end
end

get '/user/:id' do
	# byebug
	@user = User.find(params[:id])
	@statuses = @user.statuses
	# @likes = Like.find_by()
	erb :"static/user_profile"
end

get '/dashboard' do
	# byebug
	@user = User.find(current_user.id)
	@statuses = @user.statuses
	# byebug
	# @likes = @statuses.likes
	erb :"static/dashboard"
end

get '/statuses/:status_id' do
	@status = Status.find(params[:status_id])
	@likes = @status.likes
	@user = @status.user
	erb :"static/status_page"
end

post '/statuses/new' do
	@status = Status.new(status: params[:status], user_id: current_user.id)
	if @status.save
		redirect '/home'
	else
		@errormsg = "Fail, try again."
		redirect '/home'
	end
end

post '/statuslike/:id/like' do 
	@statuslike = Like.find_by(status_id:params[:id], user_id: current_user.id)
	  if @statuslike
      if @statuslike.like == 1
         @statuslike.like = 0
      elsif @statuslike.like == 0 
         @statuslike.like = 1
      end
	  else
	     @statuslike = Like.new(status_id: params[:id], user_id: current_user.id, like: 1)
	  end
	  @statuslike.save
	  redirect '/home'
end

post '/statuses/update/:id' do
	@status_update = Status.find(params[:id])
	@status_update.update(status: params[:status_update], user_id: current_user.id)
	@status_update.save
	redirect '/dashboard'
end

post '/statuses/delete/:id' do
	@delete = Status.delete(params[:id])
	redirect "/dashboard"
end