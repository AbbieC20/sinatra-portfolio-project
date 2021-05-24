class UsersController < ApplicationController 

  get "/signup" do
    if logged_in?
      redirect '/records'
    else 
      erb :'/users/signup'
    end 
  end

  post "/signup" do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
        redirect '/signup'  
    elsif !User.find_by(:username => params[:username]).nil?
      redirect '/login' 
    else
        user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        if user.save
          session[:user_id] = user.id
          redirect '/records/records'
        else
          redirect '/signup'
        end
    end
  end

  get "/login" do 
    if logged_in?
      redirect '/records'
    else 
      erb :'/users/login'
    end 
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/records'
    else
      redirect '/login'
    end
  end

  get "/logout" do
    session.clear
    redirect '/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/records/user_records'
  end

  helpers do
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        User.find(session[:user_id])
      end
  end

end