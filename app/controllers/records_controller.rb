class RecordsController < ApplicationController 

    get "/records" do
        if logged_in?
            @records = Record.all
            erb :'/records/records'
        else
            redirect "/login"
        end 
    end

    get "/records/new" do
        if logged_in?
            erb :'/records/new'
        else
            redirect "/login"
        end 
    end
    
    post "/records" do 
        if params[:name].empty? || params[:location].empty? 
            redirect "/records/new"
        else 
            Record.create(:name => params[:name], :location => params[:location], :category => params[:category], :notes => params[:notes], :user_id => current_user.id)
            redirect "/records"
        end
    end

    get "/records/:slug" do
        if logged_in?
            @record = Record.find_by_slug(params[:slug])
            if !@record.nil?
                erb :'/records/individual_record'
            else
                redirect "/records"
            end
        else
            redirect "/login"
        end 
    end

    get "/records/:slug/edit" do
        if logged_in? 
            @record = Record.find_by_slug(params[:slug])
            if current_user.id == @record.user_id
                erb :'/records/edit_record'
            else
                redirect "/records"
            end
        else
            redirect "/login"
        end 
    end

    patch "/records/:slug" do 
        @record = Record.find_by_slug(params[:slug])
        if params[:name].empty? || params[:location].empty? 
            redirect "/records/#{@record.slug}/edit"
        end
        @record.update(:name => params[:name], :location => params[:location], :category => params[:category], :notes => params[:notes])
        redirect "/records/#{@record.slug}"
    end
 
    delete "/records/:slug/delete" do
        @record = Record.find_by_slug(params[:slug])
        if current_user.id == @record.user_id
            @record.delete
            redirect "/records"
        else
            redirect "/records"
        end
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

