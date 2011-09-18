# coding: utf-8
require '../lib/google_translate.rb'
require "test/unit"

class TestGoogleTranslate < Test::Unit::TestCase
  
  def test_spanish
    from = 'es'
    to = 'en'
    @t = Google::Translator.new(from, to, {:api_key => ENV['GOOGLE_API_KEY']})
    
    assert_equal('dog', @t.translate('perro') )
    assert_equal('Dog', @t.translate('Perro') )
    assert_equal('Hello', @t.translate('Hola') )
    assert_equal('Athletic', @t.translate('Atlético') )
    assert_equal('Giraffe', @t.translate('Jirafa') )
    assert_equal('search', @t.translate('búsqueda') )
    assert_equal('translation', @t.translate('traducción') )
  end
    
  def test_french
    from = 'es'
    to = 'fr'
    @t = Google::Translator.new(from, to, {:api_key => ENV['GOOGLE_API_KEY']})
    
    assert_equal('chien', @t.translate('perro') )
    
  end

end