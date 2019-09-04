class PatientsController < ApplicationController
  get '/patients' do
    if logged_in?
      @patients= Patient.all
      erb :'patients/index'
    else
      redirect to '/login'
    end
  end

  get '/patients/new' do
    if logged_in?
      erb :'patients/new'
    else
      redirect to '/login'
    end
  end

  post '/patients' do
    if logged_in?
      if params[:name] == "" || params[:medical_record_number] == "" || params[date_of_birth] == ""
        redirect to "/patients/new"
      else
        @patient = current_user.patients.build(name: params[:name], medical_record_number: params[:medical_record_number], date_of_birth: params[:date_of_birth])
        if @patient.save
          redirect to "/patients/#{@patient.id}"
        else
          redirect to "/patients/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/patients/:id' do
    if logged_in?
      @patient = Patient.find_by_id(params[:id])
      erb :'patients/show'
    else
      redirect to '/login'
    end
  end

  # GET: /patients/5/edit
  get "/patients/:id/edit" do
    erb :"/patients/edit.html"
  end

  # PATCH: /patients/5
  patch "/patients/:id" do
    redirect "/patients/:id"
  end

  # DELETE: /patients/5/delete
  delete "/patients/:id/delete" do
    redirect "/patients"
  end
end
