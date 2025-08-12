# name: discourse-category-locale
# about: Locales and hreflang fields for chosen categories
# version: 0.5
# authors: IDW
# url: https://github.com/zamozhnii/discourse-category-locale.git

enabled_site_setting :enable_discourse_category_locale

after_initialize do
  add_to_serializer(:category, :local_lang, false) do
    object.custom_fields && object.custom_fields["local_lang"]
  end
  add_to_serializer(:category, :hreflang_code, false) do
    object.custom_fields && object.custom_fields["hreflang_code"]
  end
end