class EntriesController < ApplicationController

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new
    @user = User.find_by({ "id" => session["user_id"] })
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]  
    @entry["place_id"] = params["place_id"]
    #@entry.uploaded_image.attach(params["entry"]["uploaded_image"])
    @entry["user_id"] = @user["id"]    
    @entry.uploaded_image.attach(params["uploaded_image"])
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
