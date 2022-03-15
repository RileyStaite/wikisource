class SourceController < ApplicationController
  def index
    if(params["search"] == nil)
      params["search"] = "Search"
    end
  end
end
