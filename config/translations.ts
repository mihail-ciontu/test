import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

import * as translations from '@/translations';
i18n.use(initReactI18next).init({
  ns: ['login', 'test'],
  defaultNS: 'login',
  nsSeparator: ':',
  compatibilityJSON: 'v3',
  resources: {
    ...Object.entries(translations).reduce((acc, [key, value]) => {
      return {
        ...acc,
        [key]: {
          ...value,
        },
      };
    }, {}),
  },
  lng: 'en',
  fallbackLng: 'en',
  interpolation: {
    escapeValue: false,
  },
  returnNull: false,
  react: {
    useSuspense: false,
  },
});

export default i18n;
