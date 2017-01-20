#Set dafault locale to something other than :en
I18n.available_locales = [:en, :ja]
I18n.default_locale = :ja

# where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]