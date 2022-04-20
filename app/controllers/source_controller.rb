class SourceController < ApplicationController
  def index
    if(params["search"] == nil)
      params["search"] = "Search"
    end
    #the views would work best if this sources instance variable was a hash
    @link = params["search"]
    @sources = Reference.scrape_references(params["search"])
    @page = Wikipedia.find(params["search"])
    if @sources[:status] == :completed && @sources[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:notice] = "Unable to find references from given URL"
    end
    rescue StandardError => e
      flash.now[:alert] = "Error: #{e}" 
  end

  def home
    #the views would work best if this sources instance variable was a hash
    @link = params["search"]
    @sources = Reference.scrape_references(@link)
    @page = Wikipedia.find(@link)
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

  def saved
    @saved_sources = ["http://weblog.rubyonrails.org/2005/12/13/rails-1-0-party-like-its-one-oh-oh/", "https://rubyonrails.org/2022/3/8/Rails-7-0-2-3-6-1-4-7-6-0-4-7-and-5-2-6-3-have-been-released", "https://github.com/rails/rails/releases/tag/v6.0.3.4", "http://guides.rubyonrails.org/getting_started.html#what-is-rails-questionmark", "https://appsearch.org/blog/django-vs-ruby-on-rails/", "https://www.se-radio.net/2021/08/episode-471-jason-meller-on-choosing-the-right-tech-stack-for-a-greenfield-project/", "https://web.archive.org/web/20130225091835/http://dev.mysql.com/tech-resources/interviews/david-heinemeier-hansson-rails.html", "http://weblog.rubyonrails.org/2006/8/7/ruby-on-rails-will-ship-with-os-x-10-5-leopard", "http://weblog.rubyonrails.org/2009/3/16/rails-2-3-templates-engines-rack-metal-much-more", "https://web.archive.org/web/20130209055716/http://rubyonrails.org/merb", "http://edgeguides.rubyonrails.org/3_0_release_notes.html", "http://www.sdtimes.com/link/34122", "http://guides.rubyonrails.org/3_1_release_notes.html", "http://guides.rubyonrails.org/3_2_release_notes.html", "http://weblog.rubyonrails.org/2011/12/20/rails-master-is-now-4-0-0-beta/", "https://github.com/rails/rails/pull/9406", "http://weblog.rubyonrails.org/2013/6/25/Rails-4-0-final/", "http://weblog.rubyonrails.org/2014/4/8/Rails-4-1/", "http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/", "http://weblog.rubyonrails.org/2016/6/30/Rails-5-0-final/", "http://weblog.rubyonrails.org/2017/4/27/Rails-5-1-final/", "https://weblog.rubyonrails.org/2018/4/9/Rails-5-2-0-final/", "https://weblog.rubyonrails.org/2018/12/4/Rails-5-2-2-has-been-released/", "https://weblog.rubyonrails.org/2019/8/15/Rails-6-0-final-release/", "https://weblog.rubyonrails.org/2020/12/9/Rails-6-1-0-release/", "https://rubyonrails.org/2021/12/15/Rails-7-fulfilling-a-vision", "https://devalot.com/articles/2012/03/ror-compatibility", "https://guides.rubyonrails.org/upgrading_ruby_on_rails.html#ruby-versions", "https://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html#ruby-versions", "http://weblog.rubyonrails.org/2005/12/13/rails-1-0-party-like-its-one-oh-oh/", "http://weblog.rubyonrails.org/2007/1/18/rails-1-2-rest-admiration-http-lovefest-and-utf-8-celebrations"]
  end

  def download
    if params[:output]
      File.open("sourcely.txt", 'w') do |f|
        f.puts(params[:output])
        return send_file(f)
        sleep(5)
        File.delete(f)
      end
    end
  rescue Errno::ENOENT
  end

  def delete
    if params[:output]
      #arrays can just do .delete(args) and it will remove that value
      #when the model for the user is set up use the array of saved sources and use:
      #@saved_sources.delete(params[:output])
    end
  end

end
