class PatientsController < ApplicationController
  get '/patients' do
    @patients= Patient.all
      erb :'patients/index'
  end

  # get patients/new to render a form to create new entry
  get '/patients/new' do
    redirect_if_not_logged_in
    erb :'patients/new'
  end

  # post patients to create a patient
  post '/patients' do
    # binding.pry
    redirect_if_not_logged_in
    # I want to create a new patient and save it to the DB 
    # I also only want to create a patient if a nurse is logged in
    # I only want to save the patient with some info
    if Patient.valid_params?(params)
      # create a new patient
      @patient = Patient.create(name: params[:name], nurse_id: current_user.id, medical_record_number: params[:medical_record_number], date_of_birth: params[:date_of_birth])
      flash[:message] = "Patient successfully created." if @patient.id
      redirect "/patients/#{@patient.id}"
    else
      flash[:errors] = "Something went wrong - you must provide content for your entry."
      redirect '/patients/new'
    end
  end

  get '/patients/:id' do
    set_patient
    erb :'patients/show'
  end

  # This route should send us to patients/edit.erb, which will render an edit form
  get '/patients/:id/edit' do  
    redirect_if_not_logged_in
    set_patient
    if authorized_to_edit?(@patient)
      erb :'/patients/edit'
    else
      redirect "nurses/#{current_user.id}"
    end
  end
 
  patch '/patients/:id' do
    redirect_if_not_logged_in
    # 1. find the journal entry
    set_patient
    if authorized_to_edit?(@patient) && Patient.valid_params?(params) 
      # 2. modify (update) the patient
      @patient.update(name: params[:name], medical_record_number: params[:medical_record_number], date_of_birth: params[:date_of_birth])
      # 3. redirect to show page
      redirect "/patients/#{@patient.id}"
    else
      redirect "nurses/#{current_user.id}"
    end
  end
  
  delete '/patients/:id' do 
    set_patient
    if authorized_to_edit?(@patient)
      @patient.destroy
      flash[:message] = "Successfully deleted that entry."
      redirect to '/patients'
    else
      redirect to '/patients'
    end
  end
  
  private

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
