require 'rest_client'
require 'multi_json'


module Google
  class Translate
    
    def initialize(from, to='en', options={})
      @options = {
        :cache => true
      }.merge(options)

      raise(MissingApiKey) if @options[:api_key].nil?
      raise(MissingFromLanguage) if not @from.nil?
      
      @api_key = @options[:api_key]
      @from = from
      @to = to
      @cache_terms = Hash.new
      
      @service = RestClient::Resource.new('https://www.googleapis.com/language/translate/v2')
    end
    
    
    def self.Exception(*names)
      cl = Module === self ? self : Object
      names.each {|n| cl.const_set(n, Class.new(Exception))}
    end

    Exception :MissingFromLanguage, :MissingApiKey,
              :TranslateServerIsDown, :InvalidResponse, :MissingText

    def translate(from_text, ops={})
      options = {
        :cache => true
      }.merge(ops)
      
      raise(MissingFromLanguage) if @from.nil?
      raise(MissingToLanguage) if @to.nil?
      raise(MissingText) if from_text.nil?
      
      begin
        
        return @cache_terms[from_text] if options[:cache] and @cache_terms[from_text]
        
        params = {  :key => @api_key,
                    :source => @from,
                    :target => @to,
                    :q => from_text }
        
        response = @service.get :params => params, :content_type => 'json'
        
        raise(InvalidResponse, response.code) if response.code != 200
        raise(TranslateServerIsDown) if (!response || response.empty?)
     
        response = MultiJson.decode(response)      
              
        to_text = response['data']['translations'][0]['translatedText']
        @cache_terms[from_text] = to_text if options[:cache]
        return to_text
      rescue Exception => e
        raise(TranslateServerIsDown)
      end
    end

  end

end
