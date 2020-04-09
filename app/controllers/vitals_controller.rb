class VitalsController < ApplicationController
  get '/vitals' do
    redirect_if_not_logged_in 
    @vitals= Vital.all
      erb :'vitals/index'
  end

  # get patients/new to render a form to create new entry
  get '/vitals/new' do
    redirect_if_not_logged_in
    erb :'vitals/new'
  end

  # post patients to create a patient
  post '/vitals' do
    redirect_if_not_logged_in 
    if Vital.valid_params?(params)
      Vital.create(params)
      flash[:message] = "Patient successfully created." if @vital.id
      redirect "/vitals/#{@vital.id}"
    else 
      flash[:errors] = "Something went wrong - you must enter values for new vital."
      redirect '/vitals/new'
    end
  end
  
  get '/vitals/:id' do
    set_vital
    erb :'vitals/show'
  end

  # This route should send us to vitals/edit.erb, which will render an edit form
  get '/vitals/:id/edit' do  
    redirect_if_not_logged_in
    set_vital
    erb :'vitals/edit'
  end

  patch"/vitals/:id" do
    redirect_if_not_logged_in 
    # 1. find the vital
    set_vital
    if Vital.valid_params?(params) && @vital.patient != ""
      # 2. modify (update) the vital
      @vitals.update(params.select{|k|k=="blood_pressure" || k=="pulse" || k=="temperature" || k=="oxygen_level" || k=="patient_id"})
      # 3. redirect to show page
      redirect "/vitals/#{@vital.id}"
    else
      redirect "patients/#{@patient.id}"
    end
  end

  delete '/vitals/:id' do 
    set_vital
    if @vital.patient != ""
      @vital.destroy
      flash[:message] = "Successfully deleted that vital."
      redirect to '/vitals'
    else
      redirect to '/vitals'
    end
  end
 
  private

  def set_vital
    @vital = Vital.find(params[:id])
  end
end
