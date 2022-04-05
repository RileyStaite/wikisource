class SourceController < ApplicationController
  def index
    if(params["search"] == nil)
      params["search"] = "Search"
    end
  end

  def home
    #the views would work best if this sources instance variable was a hash 
    @sources = Reference.parse(params["search"])
    if @sources[:status] == :completed && @sources[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:notice] = "Unable to find references from given URL"
    end
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end 
  
  def about
  end 
end
