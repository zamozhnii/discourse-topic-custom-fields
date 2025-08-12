# name: discourse-category-locale
# about: Locales and hreflang fields for chosen categories
# version: 0.3
# authors: IDW
# url: https://github.com/zamozhnii/discourse-category-locale.git

enabled_site_setting :category_locale_enabled

after_initialize do

  add_to_serializer(:basic_category, :local_lang) do
    object.custom_fields && object.custom_fields["local_lang"]
  end

  add_to_serializer(:basic_category, :hreflang_code) do
    object.custom_fields && object.custom_fields["hreflang_code"]
  end

  add_to_serializer(:category, :local_lang) do
    object.custom_fields && object.custom_fields["local_lang"]
  end

  add_to_serializer(:category, :hreflang_code) do
    object.custom_fields && object.custom_fields["hreflang_code"]
  end

end