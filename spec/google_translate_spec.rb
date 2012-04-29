# encoding: UTF-8
require 'spec_helper'

describe Google::Translate do
  context "when initialized with source 'es' and destination 'en'" do
    
    before :all do
      from = 'es'
      to = 'en'
      @translator = Google::Translate.new(from, to, {:api_key => ENV['GOOGLE_API_KEY']})
    end
  
    it "translates words from spanish to english" do
      @translator.translate('perro').should match('dog')
    end
    
    it "caches words already translated" do
      @translator.instance_variable_get(:@cache_terms).should have_key('perro')
      @translator.instance_variable_get(:@cache_terms)['perro'].should match('dog')
    end    
  end
  
  context "when initialized with source 'es' and destination 'fr'" do
    before :all do
      from = 'es'
      to = 'fr'
      @translator = Google::Translate.new(from, to, {:api_key => ENV['GOOGLE_API_KEY']})
    end
    
    it "translates words from spanish to french" do
      @translator.translate('perro').should match('chien')
    end
    
  end
  
end

describe Google::Translator do
  context "when initialized with Translator source 'es' and destination 'en'" do
    
    before :all do
      from = 'es'
      to = 'en'
      @translator = Google::Translator.new(from, to, {:api_key => ENV['GOOGLE_API_KEY']})
    end
  
    it "translates words from spanish to english" do
      @translator.translate('perro').should match('dog')
    end
  end
end