class PatientVitalsController < ApplicationController

  # GET: /patient_vitals
  get "/patient_vitals" do
    erb :"/patient_vitals/index.html"
  end

  # GET: /patient_vitals/new
  get "/patient_vitals/new" do
    erb :"/patient_vitals/new.html"
  end

  # POST: /patient_vitals
  post "/patient_vitals" do
    redirect "/patient_vitals"
  end

  # GET: /patient_vitals/5
  get "/patient_vitals/:id" do
    erb :"/patient_vitals/show.html"
  end

  # GET: /patient_vitals/5/edit
  get "/patient_vitals/:id/edit" do
    erb :"/patient_vitals/edit.html"
  end

  # PATCH: /patient_vitals/5
  patch "/patient_vitals/:id" do
    redirect "/patient_vitals/:id"
  end

  # DELETE: /patient_vitals/5/delete
  delete "/patient_vitals/:id/delete" do
    redirect "/patient_vitals"
  end
end
