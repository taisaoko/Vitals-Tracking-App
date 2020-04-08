class PatientsController < ApplicationController
  get '/patients' do
    @patients= Patient.all
      erb :'patients/index'
  end

  # get patients/new to render a form to create new entry
  get '/patients/new' do
    if logged_in?
      redirect_if_not_logged_in
      erb :'patients/new'
    end
  end

  # post patients to create a patient
  post '/patients' do
    binding.pry
    redirect_if_not_logged_in
    # I want to create a new journal entry and save it to the DB
    # I also only want to create a journal entry if a user is logged in
    # I only want to save the entry if it has some content
    if params[:name] != "" || params[:medical_record_number] != "" || params[:date_of_birth] != ""
      # create a new patient
      @patient = Patient.create(name: params[:name], nurse_id: current_user.id, medical_record_number: params[:medical_record_number], date_of_birth: params[:date_of_birth])
      flash[:message] = "Patient successfully created." if @patient.id
      redirect "/patients/#{@patient.id}"
    else
      flash[:errors] = "Something went wrong - you must provide content for your entry."
      redirect '/patients/new'
    end
    # if logged_in?
    #   if params[:name] == "" || params[:medical_record_number] == "" || params[:date_of_birth] == ""
    #     redirect to "/patients/new"
    #   else
    #     @patient = current_user.patients.build(name: params[:name], medical_record_number: params[:medical_record_number], date_of_birth: params[:date_of_birth])
    #     if @patient.save
    #       redirect to "/patients/#{@patient.id}"
    #     else
    #       redirect to "/patients/new"
    #     end
    #   end
    # else
    #   redirect to '/login'
    # end
  end

  get '/patients/:id' do
    if logged_in?
      @patient = Patient.find_by_id(params[:id])
      erb :'patients/show'
    else
      redirect to '/login'
    end
  end

  get '/patients/:id/edit' do  
    if logged_in?
      @patient = Patient.find_by_id(params[:id])
      if @patient && @patient.nurse == current_user
        erb :'patients/edit'
      else
        redirect to '/patients'
      end
    else
      redirect to '/login'
    end
  end
 
  patch '/patients/:id' do
    @patient = Patient.find_by_id(params[:id])
    @patient.name = params[:name]
    @patient.medical_record_number = params[:medical_record_number]
    @patient.date_of_birth = params[:date_of_birth]
    @patient.save
    redirect "/patients/#{@patient.id}"
  end
  
  delete '/patients/:id/delete' do 
    @patient = Patient.find_by_id(params[:id])
    @patient.delete
    redirect to '/patients'
  end
  
end
