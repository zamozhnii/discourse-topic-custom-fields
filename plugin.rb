# name: discourse-category-locale
# about: Locales and hreflang fields for chosen categories
# version: 0.1
# authors: IDW
# url: https://github.com/zamozhnii/discourse-category-locale.git

enabled_site_setting :category_locale_enabled

after_initialize do

  # Добавляем поля к сериализатору категории
  add_to_serializer(:basic_category, :local_lang, false) do
    object.custom_fields["local_lang"]
  end

  add_to_serializer(:basic_category, :hreflang_code, false) do
    object.custom_fields["hreflang_code"]
  end

  # Для topics тоже иногда пригодится!
  add_to_serializer(:category, :local_lang, false) do
    object.custom_fields["local_lang"]
  end

  add_to_serializer(:category, :hreflang_code, false) do
    object.custom_fields["hreflang_code"]
  end

  # Для post/topic страницы тут можно расширять или кастомизировать под нужды
end