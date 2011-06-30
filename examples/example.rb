# coding: utf-8
require '../src/google_translate.rb'

api_key = ENV['GOOGLE_API_KEY']

from = 'es'
to = 'en'
@gt = Google::Translator.new(from, to, {:api_key => api_key}) 
puts @gt.translate('perro')

terms = ['Perro', 'Gato', 'Hola', 'Atlético', 'Perro', 'Jirafa', 'búsqueda', 'traducción', 'gato', 'perro']

terms.each do |t|
  puts @gt.translate(t)
end


to = 'fr'
@gt = Google::Translator.new(from, to, {:api_key => api_key})

terms.each do |t|
  puts @gt.translate(t)
end