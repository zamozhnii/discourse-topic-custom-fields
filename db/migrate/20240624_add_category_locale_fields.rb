class AddCategoryLocaleFields < ActiveRecord::Migration[6.0]
  def up
    # Нет нужды добавлять структуру, custom_fields уже есть
    # Миграция не нужна, поля появятся в custom_fields сами
  end

  def down
  end
end