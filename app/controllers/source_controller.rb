class SourceController < ApplicationController
  def index
    if(params["search"] == nil)
      params["search"] = ""
    end
    #the views would work best if this sources instance variable was a hash
    @link = params["search"]
    if valid_url?(@link) == true
      @sources = Reference.scrape_references(params["search"])
      @page = Wikipedia.find(params["search"])
    else
      @page = Wikipedia.find(params["search"])
      @link = @page.fullurl
      @sources = Reference.scrape_references(@link)
        if @sources == nil
          # Handle dismbiguation in future
        end
    end
    if @sources[:status] == :completed && @sources[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:notice] = "Unable to find references from given URL"
    end
    rescue StandardError => e
      flash.now[:alert] = "Error: #{e}" 
  end

  def valid_url?(url)
    return false if url.include?("<script")
    url_regexp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    url =~ url_regexp ? true : false
  end

  def about
  end 

  # still must save in model
  def saved
    @sourcelist = ["https://sourcely-group4.herokuapp.com/"]
    if params[:saveditem]
      @saved_sources = User.save_a_source(params[:saveditem], @sourcelist)
      end
    @saved_sources = User.show_sources(@sourcelist)
  end

  def download
    if params[:output]
      File.open("sourcely.txt", 'w') do |f|
        f.puts(params[:output])
        send_file(f)
      end
    end
  rescue Errno::ENOENT
  end

  # Downloading works now but the file isn't being deleted
  # Ruby returns the delete if it's left after send_file 
  # so it was returning the deleted file
  # Will need to delete seperately or send_file from a different function
  # If the name of the file is made dynmaic the file must be deleted.
  # This is how file deletion would work if time permitted adding it:
  # https://stackoverflow.com/questions/8530379/delete-the-file-from-the-server-after-the-download-is-completed

  def delete
    if params[:output]
      #arrays can just do .delete(args) and it will remove that value
      #when the model for the user is set up use the array of saved sources and use:
      #@saved_sources.delete(params[:output])
    end
  end

end
