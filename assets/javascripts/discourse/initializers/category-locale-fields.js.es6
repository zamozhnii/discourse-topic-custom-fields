import { withPluginApi } from 'discourse/lib/plugin-api';

export default {
  name: 'category-locale-fields',
  initialize() {
    withPluginApi('0.8', api => {
      api.addCategoryCustomField({
        field: 'local_lang',
        name: 'Категория язык (lang, например ar)',
        description: 'HTML lang для страниц этой категории',
        type: 'text',
        editable: true,
        default: ''
      });

      api.addCategoryCustomField({
        field: 'hreflang_code',
        name: 'Hreflang (например ar_AR или en_US)',
        description: 'hreflang-код для link rel=alternate',
        type: 'text',
        editable: true,
        default: ''
      });
    });
  }
};