module DefaultUrlOptions
  
    # Including this file sets the default url options. This is useful for mailers or background jobs
    
    def default_url_options
      {
        :host => host,
        :port => port
      }
    end
    
  private
  
    def host
        ENV['WEBSITE_HOSTNAME'] || 'localhost'
    end
    
    def port
        ENV['PORT']
    end
    
  end