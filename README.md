# GoogleTranslate - Simple Ruby Client for Google Translate API

http://code.google.com/apis/language/translate/overview.html

## Installation

Add this line to your application's Gemfile:

    gem 'google_translate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_translate

## Usage

   from_language = 'es'
   to_language = 'en'
   @gt = Google::Translator.new(from_language, to_language, {:api_key => 'YOUR_API_KEY'})
   puts @gt.translate('perro')

By default, the translator caches term translations in order to avoid unnecessary requests.
This can be globally disabled passing:
   :cache => false
in the options hash.

You can also skip the caching only for certain translation requests by passing
   :cache => false 
to the translate method.

   @gt.translate('A longer sentence that won't likely be repeated', { :cache => false })

See Google Translate API v2 for details about parameters, including {supported language codes}[http://code.google.com/apis/language/translate/v2/using_rest.html#language-params].

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright © 2011 Christian Hein, released under the MIT license