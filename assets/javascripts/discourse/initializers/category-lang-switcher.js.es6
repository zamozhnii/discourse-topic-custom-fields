import { withPluginApi } from 'discourse/lib/plugin-api';

export default {
  name: 'category-lang-switcher',
  initialize() {
    withPluginApi('0.8', api => {
      api.onPageChange(() => {
        const category = api.getCurrentCategory && api.getCurrentCategory();
        if (category && category.custom_fields) {
          const lang = category.custom_fields.local_lang;
          if (lang) {
            document.documentElement.lang = lang;
          }
        }
      });

      api.decorateCookedElement($elem => {
        const category = api.getCurrentCategory && api.getCurrentCategory();
        if (category && category.custom_fields) {
          const hreflang = category.custom_fields.hreflang_code;
          if (hreflang) {
            let existing = document.head.querySelector('link[data-discourse-locale]');
            if (existing) { existing.remove(); }
            const link = document.createElement("link");
            link.setAttribute("rel", "alternate");
            link.setAttribute("hreflang", hreflang);
            link.setAttribute("href", window.location.href);
            link.setAttribute("data-discourse-locale", "yes");
            document.head.appendChild(link);
          }
        }
      });
    });
  }
};