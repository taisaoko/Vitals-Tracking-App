class NursesController < ApplicationController

  # GET: /nurses
  get "/nurses" do
    erb :"/nurses/index.html"
  end

  # GET: /nurses/new
  get "/nurses/new" do
    erb :"/nurses/new.html"
  end

  # POST: /nurses
  post "/nurses" do
    redirect "/nurses"
  end

  # GET: /nurses/5
  get "/nurses/:id" do
    erb :"/nurses/show.html"
  end

  # GET: /nurses/5/edit
  get "/nurses/:id/edit" do
    erb :"/nurses/edit.html"
  end

  # PATCH: /nurses/5
  patch "/nurses/:id" do
    redirect "/nurses/:id"
  end

  # DELETE: /nurses/5/delete
  delete "/nurses/:id/delete" do
    redirect "/nurses"
  end
end
